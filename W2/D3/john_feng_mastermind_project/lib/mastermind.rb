require_relative "code"

class Mastermind

    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(code)
        puts 'exact matches: '+ @secret_code.num_exact_matches(code).to_s
        puts 'near matches: ' + @secret_code.num_near_matches(code).to_s
    end

    def ask_user_for_guess
        puts 'Enter a code'
        code = gets.chomp
        code = Code.from_string(code)
        self.print_matches(code)
        @secret_code==code
    end
end
