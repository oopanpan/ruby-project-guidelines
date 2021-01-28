class Routine < ActiveRecord::Base
    belongs_to :user
    belongs_to :pet

    def self.delete_routines_along_with_pet(pet)
        bye = Routine.all.select{|routine| routine.pet_id == pet.id}
        bye.each{|routine| routine.destroy}
    end

    def edit_routine_by_prompt
        puts "This is the #{self.pet.name}'s #{self.name} routine. Edit?"
        confirmation = true
        while confirmation
            puts "[1] Edit entry"
            puts "[2] Delete entry"
            choice = gets.chomp
            if choice == "1"
                puts "What's the new name of the routine"
                name = gets.chomp
                puts "Describe the new #{name} routine for #{self.pet.name}"
                des = gets.chomp
                self.name = name
                self.description = des
                self.save
                puts "Routine updated!"
                confirmation = false
            elsif choice == "2"
                puts "**Warning, deleting the last routine will erase pet data on your account**"
                puts "Deleteing #{self.name}, for #{self.pet.name}. Confirm? Y/N"
                del_confirm = gets.chomp
                if del_confirm == 'Y'
                    puts "***ROUTINE ENTRY DELETED***"

                    self.destroy
                    confirmation = false
                    $in_pet_menu = false
                end
            else
                puts "\nInput not regconize, please choose again."
            end
        end
    end
end