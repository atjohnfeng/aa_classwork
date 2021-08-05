require_relative "db_connection"
require_relative "question"
require_relative "user"

class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def self.find_by_id(id)
    question_follows = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?;
    SQL
    return nil unless question_follows.length > 0

    QuestionFollow.new(question_follows.first)
  end

  def self.followers_for_question_id(question_id)
     question_follows = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?;
      JOIN
        questions
      ON
        question_follows.question_id = questions.id
    SQL
    return nil unless question_follows.length > 0

    question_follows.map { |follow| User.find_by_id(follow['user_id']) }
  end

  def self.followed_questions_for_user_id(user_id)
    followed_questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?;
      JOIN
        users
      ON
        question_follows.user_id = user.id
    SQL
    return nil unless followed_questions.length > 0

    followed_questions.map { |follow| Question.find_by_id(follow['question_id']) }
  end

  def self.most_followed_questions(n)
    followed_questions = QuestionsDBConnection.instance.execute(<<-SQL, n)
    SELECT
      question_id, COUNT(questions.user_id) AS num_followers
    FROM
      question_follows
    JOIN
      questions
    ON
      question_follows.question_id = questions.id
    GROUP BY
      question_id
    ORDER BY
      COUNT(questions.user_id) DESC
    LIMIT
      ?;   
  SQL
  return nil unless followed_questions.length > 0
  
  followed_questions.map { |follow| Question.find_by_id(follow['question_id']) }

  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end