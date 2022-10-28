class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.pluck(:actor)
    end

    def locations
        self.auditions.pluck(:actor)
    end

    def lead
        found = self.auditions.find_by(hired: true)
        return "no actor has been hired for this role" unless found
        found
    end

    #understudy returns the second instance of the audition that was hired 
    #for this role or returns a string 'no actor has been hired for understudy for this role'

    def understudy
        second = self.auditions.where(hired: true)[1]
        return "no actor has been hired for this role" unless second
        second
    end

end