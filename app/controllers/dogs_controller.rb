class DogsController < ApplicationController

    def index
        @dogs=Dog.all
        # bonus
        @dogs.sort{|a,b| a.employees.count <=> b.employees.count}
        # @dogs.sort
    end

    def show
        @dog=Dog.find(params[:id])
    end



end
