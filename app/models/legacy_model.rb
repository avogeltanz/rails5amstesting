class LegacyModel < ActiveRecord::Base

  def self.find_all_records(table_name, conn_info)
    connect_to_db(conn_info)
    self.table_name = table_name
    self.all
  end

  def self.find_all_records_by_sql(table_name, conn_info)
    connect_to_db(conn_info)
    self.table_name = table_name
    query = <<-SQL
      SELECT *
      FROM #{table_name}
      WHERE percent_recommended IS NOT NULL
    SQL

    self.find_by_sql([query, table_name])
  end

  def self.find_all_records_by_select_all(table_name, conn_info)
    connect_to_db(conn_info)
    self.table_name = table_name
    query = <<-SQL
      SELECT *
      FROM #{table_name}
      WHERE percent_recommended IS NOT NULL
    SQL

    self.connection_pool.with_connection do |conn|
      conn.select_all(query)
    end
  end

  private
  def self.connect_to_db(conn_info)
    establish_connection conn_info
  end
end
