require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    p where_line = params.map { |key, val|
      "#{key} = ?"
    }.join(" AND ")

    p values = params.values

    results = DBConnection.execute(<<-SQL, *values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL
    parse_all(results)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
