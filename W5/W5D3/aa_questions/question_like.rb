require_relative 'db_connection'
require_relative 'user'

class QuestionLike
  attr_accessor :id, :question_id, :user_id
  
  # def self.all
  #   data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
  #   data.map { |datum| Question.new(datum) }
  # end

  def self.find_by_id(id)
    question_likes = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?;
    SQL
    return nil unless question_likes.length > 0

    QuestionLike.new(question_likes.first)
  end

  def self.likers_for_question_id(question_id)
    question_likers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes
      ON
        question_likes.user_id = users.id
      WHERE
        question_id = ?
    SQL
    return nil unless question_likers.length > 0

    question_likers.map { |liker| User.new(liker) }
  end

  def self.num_likes_for_question_id(question_id)
    question_likers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(users.id) AS num_users
      FROM
        users
      JOIN
        question_likes
      ON
        question_likes.user_id = users.id
      WHERE
        question_id = ?
    SQL
    return nil unless question_likers.length > 0

    question_likers.first['num_users']
  end

  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
      ON
        question_likes.question_id = questions.id
      WHERE
        questions.user_id = ?
    SQL
    return nil unless liked_questions.length > 0

    liked_questions.map { |question| Question.new(question) }
  end

  def self.most_liked_questions(n)
    liked_questions = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
      ON
        questions.id = question_likes.question_id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_likes.question_id) DESC
      LIMIT
        ?;   
    SQL
    return nil unless liked_questions.length > 0
  
    liked_questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
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