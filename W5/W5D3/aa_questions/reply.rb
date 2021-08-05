require_relative 'db_connection'
require_relative 'user'
require_relative 'question'

class Reply
  attr_accessor :id, :question_id, :user_id, :parent_reply_id, :body
  
  # def self.all
  #   data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
  #   data.map { |datum| Question.new(datum) }
  # end

  def self.find_by_id(id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?;
    SQL
    return nil unless replies.length > 0

    Reply.new(replies.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?;
    SQL
    return nil unless replies.length > 0

    replies.map { |reply| Reply.new(reply) }
  end

   def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?;
    SQL
    return nil unless replies.length > 0

    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_reply_id = options['parent_reply']
    @body = options['body']
  end

  def author
    User.find_by_id(self.user_id)
  end

  def question
    Question.find_by_id(self.question_id)    
  end

  def parent_reply
    Reply.find_by_id(self.parent_reply_id)
  end

  def child_replies
    children = Reply.find_by_question_id(self.question_id)
    children.select { |child| child.parent_reply_id == self.id}
  end

  # def create
  #   raise "#{self} already in database" if self.id
  #   QuestionDBConnection.instance.execute(<<-SQL, self.title, self.body, self.user_id)
  #     INSERT INTO
  #       questions (title, body, user_id)
  #     VALUES
  #       (?, ?, ?)
  #   SQL
  #   self.id = QuestionDBConnection.instance.last_insert_row_id
  # end
end