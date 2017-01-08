# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
VIRTUES = [
  { "Acceptance" => ": the act of accepting something or someone"  },
  { "Assertiveness" => ": disposed to or characterized by bold or confident statements and behavior" },
  { "Authenticity" => ": true to one’s own personality, spirit, or character" },
  { "Beauty" => ": the qualities in a person or a thing that give pleasure to the senses or the mind" },
  { "Caring" => ": feeling or showing concern for other people" },
  { "Cleanliness" => ": the practice of keeping yourself and your surroundings clean" },
  { "Commitment" => ": An agreement or pledge to do something in the future" },
  { "Compassion" => ": sympathetic consciousness of others’ distress together with a desire to alleviate it" },
  { "Confidence" => ": a feeling or belief that you can do something well or succeed at something" },
  { "Consideration" => ": the act of thinking carefully about something you will make a decision about" },
  { "Contentment" => ": the state of being happy and satisfied" },
  { "Cooperation" => ": a situation in which people work together to do something" },
  { "Courage" => ": mental or moral strength to venture, persevere, and withstand danger, fear, or difficulty" },
  { "Creativity" => ": the ability to make new things or think of new ideas" },
  { "Detachment" => ": lack of emotion or of personal interest" },
  { "Determination" => ": a quality that makes you continue trying to do or achieve something that is difficult" },
  { "Dignity" => ": a way of appearing or behaving that suggests seriousness and self-control" },
  { "Encouragement" => ": something that makes someone more determined, hopeful, or confident" },
  { "Enthusiasm" => ": strong excitement about something; a strong feeling of active interest in something that you like or enjoy" },
  { "Ethical" => ": following accepted rules of behavior; morally right and good" },
  { "Excellence" => ": extremely high quality" },
  { "Fairness" => ": treating people in a way that does not favor some over others" },
  { "Faith" => ": strong belief or trust in someone or something" },
  { "Flexibility" => ": willing to change or to try different things" },
  { "Forgiveness" => ": the act of forgiving someone or something" },
  { "Friendliness" => ": acting like a friend; kind and helpful" },
  { "Generosity" => ": the quality of being kind, understanding, and not selfish" },
  { "Gentleness" => ": having or showing a kind and quiet nature; not harsh or violent" },
  { "Graciousness" => ": very polite in a way that shows respect" },
  { "Gratitude" => ": a feeling of appreciation or thanks" },
  { "Harmonious" => ": having parts that are related or combined in a pleasing way" },
  { "Helpfulness" => ": making it easier to do a job, deal with a problem, etc.; giving help" },
  { "Honesty" => ": the quality of being fair and truthful" },
  { "Honor" => ": respect that is given to someone who is admired" },
  { "Hope" => ": to want something to happen or be true and think that it could happen or be true" },
  { "Humility" => ": the quality or state of not thinking you are better than other people" },
  { "Idealism" => ": the attitude of a person who believes that it is possible to live according to very high standards of behavior and honesty" },
  { "Integrity" => ": the quality of being honest and fair" },
  { "Imaginative" => ": having or showing an ability to think of new and interesting ideas: having or showing imagination" },
  { "Joyfulness" => ": feeling, causing, or showing great happiness; full of joy" },
  { "Justice" => ": the process or result of using laws to fairly judge and punish crimes and criminals" },
  { "Kindness" => ": the quality or state of being kind; a kind act" },
  { "Love" => ": a feeling of strong or constant affection for a person" },
  { "Loyalty" => ": the quality or state of being loyal" },
  { "Moderation" => ": the quality or state of being reasonable and avoiding behavior, speech, etc., that is extreme or that goes beyond what is normal or acceptable" },
  { "Modesty" => ": the quality of not being too proud or confident about yourself or your abilities" },
  { "Optimistic" => ": having or showing hope for the future; expecting good things to happen	" },
  { "Orderliness" => ": arranged or organized in a logical or regular way" },
  { "Passionate" => ": having, showing, or expressing strong emotions or beliefs" },
  { "Patience" => ": the ability to wait for a long time without becoming annoyed or upset" },
  { "Peace" => ": a state of tranquility or quiet" },
  { "Perseverance" => ": continued effort to do or achieve something despite difficulties, failure, or opposition" },
  { "Preparedness" => ": the quality or state of being prepared" },
  { "Purposefulness" => ": having a purpose as in something set up as an object or end to be attained" },
  { "Reliability" => ": the quality or state of being reliable" },
  { "Respect" => ": an act of giving particular attention" },
  { "Responsibility" => ": the quality or state of being responsible as in  moral, legal, or mental accountability" },
  { "Reverence" => ": honor or respect that is felt for or shown to (someone or something)" },
  { "Self-discipline" => ": correction or regulation of oneself for the sake of improvement" },
  { "Service" => ": contribution to the welfare of others" },
  { "Sincerity" => ": the quality or state of being sincere; honesty of mind" },
  { "Tact" => ": a keen sense of what to do or say in order to maintain good relations with others or avoid offense" },
  { "Temperate" => ": habitual moderation in the indulgence of the appetites or passions" },
  { "Tenacious" => ": persistent in maintaining, adhering to, or seeking something valued or desired" },
  { "Thankfulness" => ": conscious of benefit received" },
  { "Tolerance" => ": capacity to endure pain or hardship; sympathy or indulgence for beliefs or practices differing from or conflicting with one’s own" },
  { "Trust" => ": assured reliance on the character, ability, strength, or truth of someone or something" },
  { "Truthfulness" => ": telling or disposed to tell the truth" },
  { "Understanding" => ": an agreement of opinion or feeling; adjustment of differences	" },
  { "Unity" => ": the quality or state of being made one" },
  { "Visionary" => ": a thought, concept, or object formed by the imagination" },
  { "Wisdom" => ": accumulated philosophic or scientific learning; knowledge" },
  { "Wonder" => ": a feeling caused by seeing something that is very surprising, beautiful, amazing, etc." },
]

VIRTUES.each do |virtue|
  virtue.each do |name, details|
    Goal.create(title: name, details: details)
  end
end

5.times do |n|
  User.create(first_name: 'User', last_name: 'User', email: "user#{n}@test.com", password: 'devise')
end

Group.create(name: 'Launch Academy')

User.all.each do |user|
  random_index = rand(Group.count)
  group = Group.offset(random_index).first
  Affiliation.create(user: user, group: group)
  4.times do
    goal_index = rand(Goal.count)
    goal = Goal.offset(goal_index).first
    group_index = rand(Group.count)
    group = Group.offset(group_index).first
    Aspiration.create(user: user, goal: goal, group: group)
  end
end

40.times do
  user_index = rand(User.count)
  user = User.offset(user_index).first
  aspiration_index = rand(Aspiration.count)
  aspiration = Aspiration.offset(aspiration_index).first
  Vote.create(user: user, aspiration: aspiration )
end
