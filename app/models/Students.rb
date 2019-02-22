class Student
  require "faker"

  attr_accessor :studentid, :firstname, :lastname, :groupid, :bio, :groupname

  def self.open_connection
    return PG.connect(host: "192.168.10.150", port:"5432", dbname: "attendance_tracker", user: "postgres", password: "password")
  end

  def self.all
    con = self.open_connection
    # for n in (1..10) do
    #   "INSERT INTO students (firstname, lastname) VALUES ('Student_FN','Student_LN');"
    #   return n = n + 1;
    # end ;
    sql = "SELECT * FROM students"

    results = con.exec(sql)

    students = results.map do |student_data|
      self.hydrate student_data
    end

  end

  def self.find studentID
    con = self.open_connection

    # sql = "SELECT * FROM attendence a INNER JOIN students s ON a.studentid = s.studentid WHERE studentid=#{studentID}"

    sql = "SELECT studentid, firstname, lastname, groupid, bio FROM students WHERE studentid=#{studentID}"
    # sql2 = "SELECT * FROM attendence WHERE studentid=#{studentID}"

    result = con.exec(sql)

    student = self.hydrate result[0]
  end

    # save + update data entry
  def save
    con = Student.open_connection

    if (self.studentid)
      # update
      sql = "UPDATE students SET firstname='#{self.firstname}', lastname='#{self.lastname}', groupid='#{self.groupid}', bio='#{self.bio}' WHERE studentid = #{self.studentid}"
    else
      # add
      sql = "INSERT INTO students (firstname, lastname, groupid, bio) VALUES ('#{self.firstname}','#{self.lastname}','#{self.groupid}','#{self.bio}')"
    end
    #
    #
    con.exec(sql)
    #
  end

    # delete data entry
  def self.destroy id
    con = self.open_connection

    sql1 = "DELETE FROM attendence WHERE studentid = #{id}"

    con.exec(sql1)

    sql = "DELETE FROM students WHERE studentid = #{id}"

    con.exec(sql)
  end

  def self.hydrate student_data
    student = Student.new

    student.studentid = student_data['studentid']
    student.firstname = student_data['firstname']
    student.lastname = student_data['lastname']
    student.groupid = student_data['groupid']
    student.bio = student_data['bio']
    student
  end


  def self.group id
    con = self.open_connection

    sql = "SELECT * FROM students WHERE groupid=#{id}"

    results = con.exec(sql)

    students = results.map do |student_data|
      self.hydrate student_data
    end
  end

  def self.group_hydrate student_data
    student = Student.new

    student.studentid = student_data['studentid']
    student.groupid = student_data['groupid']
    student.groupname = student_data['groupname']
    student
  end

  def self.student_group id
    con = self.open_connection

    sql = "SELECT * FROM students s
    INNER JOIN groups g on s.groupid = g.groupid WHERE studentid=#{id}"

    result = con.exec(sql)

    students = self.group_hydrate result[0]
  end
  def self.all_student_group
    con = self.open_connection

    sql = "SELECT * FROM students s
    INNER JOIN groups g on s.groupid = g.groupid"
    results = con.exec(sql)
    students = results.map do |student_data|
      self.all_group_hydrate student_data
    end
  end

  def self.all_group_hydrate student_data
    student = Student.new
    student.studentid = student_data['studentid']
    student.groupid = student_data['groupid']
    student.groupname = student_data['groupname']
    student.firstname = student_data['firstname']
    student.lastname = student_data['lastname']
    student
  end
end
