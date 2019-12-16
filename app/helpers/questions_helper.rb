# frozen_string_literal: true

module QuestionsHelper
  def question_header(_test)
    controller.action_name.capitalize + ' ' + @test.title + ' question'
  end
end
