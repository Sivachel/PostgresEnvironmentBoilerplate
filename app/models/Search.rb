class Search
  attr_accessor :studentid, :firstname, :lastname, :groupid

  def self.open_connection
    return PG.connect(host: "192.168.10.150", port:"5432", dbname: "attendance_tracker", user: "postgres", password: "password")
  end
  #
  def self.search parameter

    # if params[:searchquery].blank?
    #   redirect_to(root_path, alert: "Empty field!") and return
    # else
      con = self.open_connection

      name = false
      numbers = false

      if parameter.tr("0-9", "").gsub(/\s+/m, '') != ''

        parameterArray = parameter.tr("0-9", "").gsub(/\s+/m, ' ').strip.split(" ")

        sqlLetters = "SELECT DISTINCT * FROM students
        WHERE
        upper(firstname) LIKE upper('#{parameterArray[0]}%')
        AND
        upper(lastname) LIKE upper('#{parameterArray[1]}%')"

        if parameterArray.count == 1
          sqlLetters += " OR upper(lastname) LIKE upper('#{parameterArray[0]}%')"
        end
        name = true
      end

      if parameter.gsub(/\D/, '').gsub(/\s+/m, '') != ''
        parameterNumber = parameter.gsub(/\D/, ' ').gsub(/\s+/m, ' ').strip.split(" ")

        sqlNumbers = "SELECT * FROM students WHERE"

        for i in 0...(parameterNumber.count) do
          sqlNumbers += " studentid = #{parameterNumber[i]} OR"
        end

         sqlNumbers += " studentid = #{parameterNumber[parameterNumber.count-1]}"
         numbers = true
      end

      if name && numbers
        sql = sqlLetters + " UNION " + sqlNumbers

      elsif name
        sql = sqlLetters

      elsif numbers
        sql = sqlNumbers

      else
        sql = " "
      end


      results = con.exec(sql)

      students = results.map do |student_data|
        self.hydrate student_data
      end
    # end
  end

  def self.hydrate student_data
    search = Search.new

    search.studentid = student_data['studentid']
    search.firstname = student_data['firstname']
    search.lastname = student_data['lastname']
    search.groupid = student_data['groupid']

    search
  end
end
