class AttendenceController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # Sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  #edit attendence
  get "/attendence/:id/edit" do

    id = params[:id].to_i

    @attendence = Attendence.find id, 'attendence'
    erb :"Attendance/edit"

  end

  # Create attendence
  post "/:id" do
    id = params[:id].to_i
    attendence = Attendence.new

    attendence.date = params[:date]
    attendence.status = params[:status]
    attendence.studentid = params[:studentid]
    attendence.comments = params[:comments].gsub(/[^\w\s]/, '')


    allAttendances = Attendence.all

    allAttendances.each do |attendance|
      if attendance.date == attendence.date && attendance.studentid == attendence.studentid
        @message = true
        redirect "/students/#{id}"
      end
    end

    attendence.save

    @message = "Attendance Added"

    redirect "/students/#{id}"
  end

  put "/attendence/:id" do
    id = params[:id].to_i

    attendence = Attendence.find id, 'attendence'

    attendence.date = params[:date]
    attendence.status = params[:status]
    attendence.comments = params[:comments].gsub(/[^\w\s]/, '')



    attendence.save


    redirect "/students/#{attendence.studentid}"

  end

  # Delete
  delete "/attendence/:id" do
    id = params[:id].to_i
    studentid = params[:studentid].to_i

    Attendence.destroy id

    redirect "/students/#{studentid}"
  end
end
