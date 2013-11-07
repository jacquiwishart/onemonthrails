class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @skills = Skill.all
  end

  def show
  end

  def new
    @skill = current_user.skills.build
  end

  def edit
  end

  def create
    @skill = current_user.skills.build(skill_params)
      if @skill.save
        redirect_to skills_url, notice: 'Skill added successfully.'
      else
        render action: 'new' 
      end
  end

  def update
      if @skill.update(skill_params)
     redirect_to @skill, notice: 'Skill was successfully updated.' 
      else
        render action: 'edit' 
    end
  end

  def destroy
    @skill.destroy
       redirect_to skills_url 
    end
 

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end

     def correct_user
      @skill = current_user.skills.find_by(id: params[:id])
      redirect_to skills_path, notice: "Not authorized to edit this skill" if @pin.nil?
    end

    def skill_params
      params.require(:skill).permit(:description)
    end
end
