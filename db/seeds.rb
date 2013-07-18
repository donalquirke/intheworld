# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Users.create(first_name: "admin", second_name: "", email: "donal.quirke@gmail.com", password: "Fully123!", password_confirmation: "Fully123!", receive_intentions: true)
Users.create(first_name: "El", second_name: "Donz", email: "el.donz@hotmail.com", password: "Fully123!", password_confirmation: "Fully123!", receive_intentions: true)
Users.create(first_name: "Info", second_name: "SantaMartaYoga", email: "info@santamartayoga.com", password: "Fully123!", password_confirmation: "Fully123!", receive_intentions: true)


intentions_list = [
[  
"Throughout the day, be mindful of the underlying attitude or mood that is shaping your perceptions and interactions.

Bring awareness to the underlying emotional volition that is gaining momentum. Deepen your sensitivity to the emotional
filter through which you are experiencing your world.

To assist with this, as you go about your day, Ask yourself the questions:

Where am I?
How do I feel?

Use the questions as an opportunity to become alive to your body and to what is going on for you. These questions
can bring you into the present moment. First connect with the physical space that you are in and ground yourself
into your physical body. feel it in awareness. Then tune into what's going on inside you. Be on the look out for 
negative emotions that are building up and priming you for an unskilful action. A bubble of negativity waiting to pop.
", 
"Mood cause us to distort reality to fit the mood.

When we are in an irritable mood, we misperceive our world so as to promote anger. We look for reasons to be angry. 
Similarily When we are in an apprehensive mood we are looking to be afraid. We are responding to the world 
with fear more than anything else, often misperceiving the world. Irritability is an excellent example of a mood 
where you are slightly annoyed all the time. When you are irritable, you are always prone to anger.
You are predisposed to anger when you are irritable. Neutral situations are interpreted as negative when you are in 
an irritable mood. When you are irritated, negative situations are viewed as having more negative weight
than they may actually have. If you are in a contemptuous mood you are quicker to 
feel disgust and disdain.
",
"Suggest some positive psychology techniques to assist with shifting out of negative moods. 
As soon as you understand what the negative emotion is telling you,
release the emotion using visualization, forgiveness and deep breathing",
"",
"",
false,
"Mindfulness of underlying attitude",
1
],
[
"Do a task alone and wholeheartedly.

Pick a task or tasks, maybe a few household chores or a personal grooming tasks, something that you would normally do,
and do it in silence. So no radio, no TV on in the background. No chatting with someone while doing it. 

Do something that takes 5-15 minutes to complete. The more time the better.

Do the tasks peacefully and with presence.", 
"We are rarely fully present to what we are doing. We tend to perform routine tasks on autopilot with our body doing one
thing and our mind something else. As we brush our teeth, we watch TV. To avoid the uncomfortable feelings of boredom as we
mop the floor or as we wash the dishes we talk or listen to the radio. We learn to sit with mental and physical discomfort in
formal practice. But quickly seek to run away from feelings of boredom or the inner talk that accompanies many of our routine
tasks.

Notice the minds tendency to complain perhaps.",
"Ajahn Sumedhos story about resistance causing him unhappiness: In the early days I would sometimes think: I didnt come here
to sweep leaves. I came here to become enlightened. So I suffered. Until I saw the complaining mind and how it prevented me
from giving myself to the situation I was in.",
"",
"",
false,
"Learning to be with something that is routine and boring",
1
],
[ 
"", 
"",
"",
"",
"",
false,
"Dummy Intention",
1
]

]

intentions_list.each do |details, the_why, note1, note2, note3, private, header, user_id|
  Intentions.create( details: details, the_why: the_why, note1: note1, note2: note2, note3: note3, private: private, header: header, user_id: user_id )
end




