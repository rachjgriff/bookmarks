require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'Takes database name and sets up a connection to it through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end

    # it 'this connection is persistent (remains active)' do
    #   connection = DatabaseConnection.setup('bookmark_manager_test')
    #
    #   expect(DatabaseConnection.connection).to eq connection
    # end
  end

  describe '.query' do
    it 'Executes a query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
