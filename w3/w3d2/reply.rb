require_relative 'questions_db'


class Reply
  attr_accessor :user_id, :question_id, :parent_id, :body
  attr_reader :id

  def self.all
    data = QuestionsDatabase.instance.execute("
    SELECT * FROM replies")
    data.map {|datum| Reply.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    user = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless user.length > 0
    user.map {|datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    q_id = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless q_id.length > 0
    q_id.map { |datum| Reply.new(datum) }
  end

  def author
    a_id = self.user_id
    object = User.find_by_id(a_id)
    object.fname
  end

  def question
    q_id = self.question_id
    object = Question.find_by_id(q_id)
    object.title
  end

  def parent_reply
    p_id = self.parent_id
    raise "no parent" unless p_id
    object = Reply.find_by_id(p_id)
    object.body
  end

  def child_replies
    p_id = self.id
    replies = QuestionsDatabase.instance.execute(<<-SQL, p_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL

    Reply.new(replies.first).body

  end

end
