# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all

  u1 = User.create!(username: "Fwep")
  u2 = User.create!(username: "badboypinoy2")
  u3 = User.create!(username: "MilkNoSugar")
  u4 = User.create!(username: "tarancacacho")
  u5 = User.create!(username: "Zezima")

  p1 = Poll.create!(title: "Friday Night Plans", user_id: u1.id)
  p2 = Poll.create!(title: "Superhero Poll", user_id: u3.id)

  q1 = Question.create!(question: "What to eat for dinner?", poll_id: p1.id)
  ac1 = AnswerChoice.create!(choice: "Pizza", question_id: q1.id)
  ac2 = AnswerChoice.create!(choice: "Tacos", question_id: q1.id)
  ac3 = AnswerChoice.create!(choice: "KBBQ", question_id: q1.id)

  q2 = Question.create!(question: "Who's the best superhero?", poll_id: p2.id)
  ac4 = AnswerChoice.create!(choice: "Iron-Man", question_id: q2.id)
  ac5 = AnswerChoice.create!(choice: "Batman", question_id: q2.id)
  ac6 = AnswerChoice.create!(choice: "Superman", question_id: q2.id)
  ac7 = AnswerChoice.create!(choice: "Elon Musk", question_id: q2.id)

  # r1 = Response.create!(
  #   respondent: u1,
  #   answer_choice: ac1
  # )

  r2 = Response.create!(
    respondent: u2,
    answer_choice: ac2
  )

  r3 = Response.create!(
    respondent: u3,
    answer_choice: ac3
  )

  r4 = Response.create!(
    respondent: u4,
    answer_choice: ac2
  )

  r5 = Response.create!(
    respondent: u5,
    answer_choice: ac3
  )

  r6 = Response.create!(
    respondent: u1, answer_choice: ac4
  )

  r7 = Response.create!(
    respondent: u2, answer_choice: ac4
  )
  # r8 = Response.create!(
  #   respondent: u3, answer_choice: ac3
  # )
  r9 = Response.create!(
    respondent: u4, answer_choice: ac5
  )
  r10 = Response.create!(
    respondent: u5, answer_choice: ac7
  )
end