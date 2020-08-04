require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question
    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.id = ?
        SQL

        return nil if question.length <= 0
        
        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.author_id = ?
        SQL

        return nil if question.length <= 0
        question
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
end

class User
    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        user = QuestionsDBConnection.instance.execute(<<-SQL, id)   
            SELECT
                *
            FROM
                users
            WHERE
                users.id = ?
        SQL

        return nil if user.length <= 0
        
        User.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end

class QuestionFollow
    attr_accessor :id, :question_id, :user_id

    def self.find_by_id(id)
        question_follow = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                question_follows.id = ?
        SQL

        return nil if question_follow.length <= 0

        QuestionFollow.new(question_follow.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

end

class Reply
    attr_accessor :id, :subject_question_id, :parent_reply_id, :author_id, :reply_body

    def self.find_by_id(id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.id = ?
        SQL

        return nil if reply.length <= 0

        Reply.new(reply.first)
    end

    def self.find_by_user_id(user_id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.user_id = ?
        SQL

        return nil if reply.length <= 0
        reply
    end

    def self.find_by_question_id(question_id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.question_id = ?
        SQL

        return nil if reply.length <= 0
        reply
    end

    def initialize(options)
        @id = options['id']
        @subject_question_id = options['subject_question_id']
        @parent_reply_id = options['parent_reply_id']
        @author_id = options['author_id']
        @reply_body = options['reply_body']
    end
end

class QuestionLike
    attr_accessor :id, :question_id, :user_id

    def self.find_by_id(id)
        question_like = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                question_likes.id = ?
        SQL

        return nil if question_like.length <= 0

        QuestionLike.new(question_like.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end

