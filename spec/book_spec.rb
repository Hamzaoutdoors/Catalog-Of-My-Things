# frozen_string_literal: true

require_relative '../book'

describe Book do
  before :each do
    @book_album = [Book.new('Luis Hernandez', 'New', '2010-05-02'), Book.new('Luis Perez', 'Old', '2013-05-02')]
  end

  it 'Can be archived?' do
    can_be_archived = @book_album[0].send(:can_be_archived?)
    expect(can_be_archived).to be true
  end

  it 'Can be archived?' do
    can_be_archived = @book_album[1].send(:can_be_archived?)
    expect(can_be_archived).to be false
  end
end
