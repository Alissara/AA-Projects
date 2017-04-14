require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @columns = data.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|

      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    table = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    self.parse_all(table)
  end

  def self.parse_all(results)
    arr = []
    results.map do |obj|
      arr << self.new(obj)
    end
    arr
  end

  def self.find(id)
    table = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = #{id}
    SQL
    self.parse_all(table).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      unless self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      else
        self.send("#{attr_name}=", value)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    col_names = self.class.columns.join(',')
    n = self.class.columns.length
    question_marks = (["?"] * n).join(',')
    values = attribute_values
    table = DBConnection.execute(<<-SQL, *values)
      INSERT INTO
        #{self.table_name} #{col_names}
      VALUES
        #{question_marks}
    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
