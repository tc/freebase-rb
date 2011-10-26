module Freebase

  # http://wiki.freebase.com/wiki/MQL_key_escaping
  class MqlKey
    MQL_KEY_REGEX = /^[A-Za-z0-9][A-Za-z0-9_-]*[A-Za-z0-9_]$/
    MQL_KEY_BODY = /[A-Za-z0-9_-]/

    def self.encode(raw)
      final = ""
      if raw.match MQL_KEY_REGEX
        final = raw
      else
        unicoded = ""
        raw.each_char do |c|
          if c.to_s.match MQL_KEY_BODY
            unicoded << c
          else
            hex_val = get_hex(c)
            unicoded << hex_val
          end
        end

        # Check first and last characters
        if unicoded[0] == '_' or unicoded[0] == '-'
          unicoded = get_hex(unicoded[0]) + unicoded[1...unicoded.length]
        end
        if unicoded[unicoded.length - 1] == '-'
          unicoded = unicoded[0...unicoded.length - 1] + get_hex(unicoded[unicoded.length - 1])
        end

        final = unicoded

      end
      final
    end

    def self.decode(mql_raw)
      final = ""
      i = 0

      while i < mql_raw.length
        if mql_raw[i] == '$'
          encoded_val = mql_raw[i + 1...i + 5]
          final << encoded_val.to_i(16).chr
          i += 5
        else
          final += mql_raw[i]
          i += 1
        end
      end
      final
    end

    private

    def self.get_hex(c)
      sprintf('$%04X', c.unpack('U')[0])
    end

  end
end

