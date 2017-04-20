class User::WaterParametersController < ApplicationController
 def create
   tank = Tank.find(params[:format])
   water = tank.water_parameters.new(strong_params)
   if water.save
     flash[:success] = "*** #{tank.name} Parameters were added successfully! ***"
     redirect_to dashboard_path(current_user)
   else
     flash[:error] = "*** All fields must be populated! ***"
   end
 end



 private

 def strong_params
   params.require("water_parameter").permit(:ph, :nitrite, :nitrate, :ammonia, :water_change, :format)
 end
end
