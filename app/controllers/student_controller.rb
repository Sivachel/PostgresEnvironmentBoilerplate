
class StudentController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # Sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Student index
  get "/students/index" do

    @students = Student.all_student_group

    erb :"Students/index"
  end

  #new
  get "/students/new" do
    @Student = Student.new
    erb :"Students/add"
  end

  # Uses faker to generate names
  get "/students/generate_names" do
    @students = Student.all
    @students.each do |student|
      student.firstname = Faker::Name.first_name.gsub(/\W/, '')
      student.lastname = Faker::Name.last_name.gsub(/\W/, '')
      student.save
    end
    groupid = params[:groupid].to_i

    redirect "/#{groupid}"
  end

  # Show students in group
  get "/students/:studentid" do
    studentid = params[:studentid].to_i

    @students = Student.find studentid
    @group = Student.student_group studentid

    @onTimeCount = Attendence.findAverage studentid, "On Time"
    @less5Count = Attendence.findAverage studentid, '<5 Min Late'
    @more5Count = Attendence.findAverage studentid, '>5 Min Late'
    @authorisedCount = Attendence.findAverage studentid, 'Authorised Absence'
    @unAuthorisedCount = Attendence.findAverage studentid, 'Unauthorised Absence'

    if @onTimeCount.nan?
      @onTimeCount = 0.0
      @less5Count = 0.0
      @more5Count = 0.0
      @authorisedCount = 0.0
      @unAuthorisedCount = 0.0
    end

    # @attendence = Attendence.find id

    erb :"Students/show"
  end

  #edit
  get "/students/:studentid/edit" do
    studentid = params[:studentid].to_i
    @Student = Student.find studentid
    erb :"Students/edit"
  end

  # Create
  post "/students/" do
    student = Student.new

    student.firstname = params[:firstname].gsub(/\W/, '')
    student.lastname = params[:lastname].gsub(/\W/, '')
    student.groupid = params[:groupid]
    student.bio = params[:bio].gsub(/[^\w\s]/, '')

    groupidcheck = params[:groupid].gsub(/\D/, '')

    if groupidcheck == ''
      groupidcheck = 1
    end

    student.groupid = groupidcheck
    student.save

    redirect "/"
  end

  # Update
  put "/students/:studentid" do
    studentid = params[:studentid].to_i

    student = Student.find studentid

    student.firstname = params[:firstname].gsub(/\W/, '')
    student.lastname = params[:lastname].gsub(/\W/, '')
    student.groupid = params[:groupid]
    student.bio = params[:bio].gsub(/[^\w\s]/, '')

    student.save

    redirect "/students/#{studentid}"
  end

  # Delete
  delete "/students/:id" do
    id = params[:id].to_i

    Student.destroy id

    redirect "/"
  end
end
