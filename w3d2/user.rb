require_relative 'questions_db'

class User
  attr_accessor :fname, :lname
  attr_reader :id

  def self.all
    data = QuestionsDatabase.instance.execute("
    SELECT * FROM users")
    data.map {|datum| User.new(datum)}
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless name.length > 0
    User.new(name.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in db " if @id
    QuestionsDatabase.instance.execute(<<-SQL, @id, @fname, @lname)
      INSERT INTO
        users (id, fname, lname)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def authored_questions
    questions = Question.find_by_author_id(self.id)
    questions.map { |question| [question.title, question.body] }
  end

  def authored_replies
    replies = Reply.find_by_user_id(self.id)
    replies.map {|reply| reply.body }
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    id = @id
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        COUNT(question_likes.user_id)
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.author_id = ?
      GROUP BY
        questions.id
      SQL

    



  end
end
