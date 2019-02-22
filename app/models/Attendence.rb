class Attendence

  attr_accessor :attendenceid, :date, :status, :studentid, :comments, :count

  def self.open_connection
     return PG.connect(host:"192.168.10.150", port:"5432", dbname: "attendance_tracker", user: "postgres", password: "password")
  end

  def self.all
    con = self.open_connection

    sql = "SELECT * FROM attendence ORDER BY dateofattendence"

    results = con.exec(sql)

    students = results.map do |student_data|
      self.hydrate student_data
    end
  end


  def self.find attendenceid, databasename
    con = self.open_connection

    if databasename === 'student'
      sql = "SELECT * FROM attendence WHERE studentid=#{attendenceid} ORDER BY dateofattendence"

      results = con.exec(sql)

      student = results.map do |student_data|
        self.hydrate student_data
      end

    elsif databasename === 'attendence'
      sql = "SELECT * FROM attendence WHERE attendenceid=#{attendenceid} ORDER BY dateofattendence"

      results = con.exec(sql)

      student = self.hydrate results[0]
    end



  end

  # save + update data entry
  def save
    connection = Attendence.open_connection

    if (self.attendenceid)
      # update
      sql = "UPDATE attendence SET dateofattendence='#{self.date}', status='#{self.status}', comment='#{self.comments}' WHERE attendenceid = #{self.attendenceid}"
    else
      # add
      sql = "INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('#{self.date}', '#{self.studentid}', '#{self.status}', '#{self.comments}') ;"
    end

    connection.exec(sql)
  end
    # save + update data entry
    # def self.save
    #   con = Students.open_connection
    #
    #   if (self.StudentID)
    #     # update
    #     sql = "UPDATE students SET title='#{self.title}', description='#{self.description}' WHERE id = #{self.id}"
    #   else
    #     # add
    #     sql = "INSERT INTO students (title, description) VALUES ('#{self.title}','#{self.description}')"
    #   end
    #
    #
    #   con.exec(sql)
    #
    # end

    # delete data entry
    def self.destroy id
      con = self.open_connection

      sql = "DELETE FROM attendence WHERE attendenceid = #{id}"

      con.exec(sql)
    end

    def self.hydrate student_data
      studentAttend = Attendence.new

      studentAttend.date = student_data['dateofattendence']
      studentAttend.status = student_data['status']
      studentAttend.studentid = student_data['studentid']
      studentAttend.comments = student_data['comment']
      studentAttend.attendenceid = student_data['attendenceid']
      studentAttend
    end

    def self.findAverage id, status
      con = self.open_connection

      sql1 = "SELECT count(*) AS \"count\" FROM attendence a INNER JOIN students s ON a.studentid = s.studentid where s.studentid = #{id} AND a.status = '#{status}'"
      sql2 = "select count(a.status) from attendence a inner join students s on a.studentid = s.studentid where s.studentid = #{id}"

      result1 = con.exec(sql1)[0]["count"].to_f
      result2 = con.exec(sql2)[0]["count"].to_f
      result3 = (result1 / result2) * 100
      # return result1[0]

      # result2 = con.exec(sql2)

      # count1 = self.hydrate result1[0]
      # count1["count"]
      # print "Hello"
      # "Count is #{count1}"
      # count1.keys
      # count1["count"]
      # count2 = self.hydrate result2[0]

      # result = (count1 / count2)*100


    end

  end
