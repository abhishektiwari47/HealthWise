import '../pages/challenges.dart';
import '../pages/exercise.dart';
import '../pages/planner.dart';

List<ExerciseItem> exercises = [
    ExerciseItem(
      name: "Pushups",
      details: "A basic upper body exercise that works the chest, shoulders, and triceps.",
      steps: [
        "Get down on all fours, placing your hands slightly wider than your shoulders.",
        "Straighten your arms and legs.",
        "Lower your body until your chest nearly touches the floor.",
        "Pause, then push yourself back up.",
        "Repeat."
      ],
      warning: "People with wrist or shoulder injuries should avoid pushups or perform them on their knees."
    ),
    ExerciseItem(
      name: "Squats",
      details: "A fundamental exercise that targets the thighs, hips, and buttocks.",
      steps: [
        "Stand with feet a little wider than shoulder-width apart, hips stacked over knees, and knees over ankles.",
        "Extend your arms out straight so they are parallel with the ground, palms facing down.",
        "Initiate the movement by inhaling and unlocking your hips, slightly bringing them back.",
        "Continue to send hips backward as your knees begin to bend.",
        "Lower down as if sitting into a chair, with the chest and shoulders upright.",
        "Keep the head facing forward with eyes straight ahead for a neutral spine.",
        "Press the heels into the floor to return to the starting position."
      ],
      warning: "Avoid if you have knee or hip issues."
    ),
    ExerciseItem(
      name: "Lunges",
      details: "An exercise that works the hips, glutes, quads, hamstrings, and core.",
      steps: [
        "Stand tall with feet hip-width apart.",
        "Take a step forward with your right leg and lower your body until your right thigh is parallel to the floor and your left knee is nearly touching the floor.",
        "Push back up to the starting position.",
        "Repeat on the other side."
      ],
      warning: "Avoid if you have knee problems or balance issues."
    ),
    ExerciseItem(
      name: "Plank",
      details: "An isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.",
      steps: [
        "Get into a pushup position on the floor.",
        "Bend your elbows 90 degrees and rest your weight on your forearms.",
        "Keep your body in a straight line from head to feet.",
        "Hold the position as long as possible."
      ],
      warning: "Avoid if you have lower back pain or shoulder issues."
    ),
    ExerciseItem(
      name: "Burpees",
      details: "A full body exercise that combines a squat, pushup, and jump.",
      steps: [
        "Stand with your feet shoulder-width apart.",
        "Lower your body into a squat position and place your hands on the floor.",
        "Kick your feet back into a pushup position and lower your chest to the floor.",
        "Push your chest up and jump your feet back into the squat position.",
        "Leap up as high as possible from the squat position."
      ],
      warning: "Avoid if you have knee or back problems."
    ),
    ExerciseItem(
      name: "Bicep Curls",
      details: "An exercise that targets the biceps muscles.",
      steps: [
        "Stand with your feet shoulder-width apart and hold a dumbbell in each hand.",
        "Let your arms hang down at your sides with your palms facing forward.",
        "Keep your upper arms stationary as you curl the weights up to shoulder level.",
        "Slowly lower the weights back to the starting position."
      ],
      warning: "Avoid if you have elbow or shoulder pain."
    ),
    ExerciseItem(
      name: "Tricep Dips",
      details: "An exercise that targets the triceps muscles.",
      steps: [
        "Sit on the edge of a chair or bench and place your hands next to your hips.",
        "Slide your butt off the edge and hold yourself up with your arms.",
        "Lower your body until your elbows are bent at about a 90-degree angle.",
        "Push back up to the starting position."
      ],
      warning: "Avoid if you have shoulder or wrist issues."
    ),
    ExerciseItem(
      name: "Sit-ups",
      details: "An abdominal exercise that strengthens the core.",
      steps: [
        "Lie on your back with your knees bent and feet flat on the floor.",
        "Place your fingertips behind your ears.",
        "Lift your torso up towards your knees, then lower back down to the starting position."
      ],
      warning: "Avoid if you have lower back problems."
    ),
    ExerciseItem(
      name: "Mountain Climbers",
      details: "A full body exercise that increases heart rate and burns calories.",
      steps: [
        "Start in a plank position.",
        "Bring your right knee towards your chest.",
        "Quickly switch legs, bringing your left knee towards your chest.",
        "Continue alternating legs at a fast pace."
      ],
      warning: "Avoid if you have wrist or shoulder pain."
    ),
    ExerciseItem(
      name: "Jumping Jacks",
      details: "A cardiovascular exercise that increases heart rate and burns calories.",
      steps: [
        "Stand with your feet together and your hands at your sides.",
        "Jump up, spreading your legs and raising your arms above your head.",
        "Jump again, bringing your legs together and your arms back to your sides."
      ],
      warning: "Avoid if you have knee or ankle issues."
    ),
    ExerciseItem(
      name: "High Knees",
      details: "A cardiovascular exercise that engages the core and strengthens the legs.",
      steps: [
        "Stand with your feet hip-width apart.",
        "Run in place, bringing your knees up towards your chest as high as possible.",
        "Keep a fast pace and pump your arms as you move."
      ],
      warning: "Avoid if you have knee or hip problems."
    ),
    ExerciseItem(
      name: "Side Plank",
      details: "An isometric core exercise that strengthens the obliques and shoulders.",
      steps: [
        "Lie on your side with your legs straight.",
        "Prop yourself up on your elbow and raise your hips off the floor.",
        "Hold the position as long as possible.",
        "Repeat on the other side."
      ],
      warning: "Avoid if you have shoulder or lower back issues."
    ),
    ExerciseItem(
      name: "Russian Twists",
      details: "A core exercise that targets the oblique muscles.",
      steps: [
        "Sit on the floor with your knees bent and your feet flat.",
        "Lean back slightly and lift your feet off the floor.",
        "Hold your hands together in front of your chest.",
        "Twist your torso to the right, then to the left to complete one rep."
      ],
      warning: "Avoid if you have lower back pain."
    ),
    ExerciseItem(
      name: "Leg Raises",
      details: "An exercise that targets the lower abs.",
      steps: [
        "Lie on your back with your legs straight and your arms at your sides.",
        "Lift your legs up towards the ceiling until they are perpendicular to the floor.",
        "Slowly lower your legs back down without touching the floor."
      ],
      warning: "Avoid if you have lower back problems."
    ),
    ExerciseItem(
      name: "Calf Raises",
      details: "An exercise that targets the calf muscles.",
      steps: [
        "Stand with your feet hip-width apart.",
        "Slowly raise your heels off the floor, balancing on the balls of your feet.",
        "Hold for a moment, then lower your heels back down."
      ],
      warning: "Avoid if you have ankle issues."
    ),
    ExerciseItem(
      name: "Glute Bridges",
      details: "An exercise that targets the glutes and lower back.",
      steps: [
        "Lie on your back with your knees bent and your feet flat on the floor.",
        "Lift your hips towards the ceiling, squeezing your glutes.",
        "Hold for a moment, then lower your hips back down."
      ],
      warning: "Avoid if you have lower back problems."
    )
  ];


   List<ChallengeItem> challenges = [
  ChallengeItem(title: "20 Pushups"),
  ChallengeItem(title: "30 Pushups"),
  ChallengeItem(title: "500 m Run"),
  ChallengeItem(title: "10 Minutes Meditation"),
  ChallengeItem(title: "5 km Walk"),
  ChallengeItem(title: "3 Liters of Water in a day"),
  ChallengeItem(title: "50 Squats"),
  ChallengeItem(title: "20 Lunges"),
  ChallengeItem(title: "15 Minutes Yoga"),
  ChallengeItem(title: "1 Hour Without Screen"),
  ChallengeItem(title: "No Sugar for a Day"),
  ChallengeItem(title: "8 Hours of Sleep"),
  ChallengeItem(title: "Plank for 1 Minute"),
  ChallengeItem(title: "30 Jumping Jacks"),
  ChallengeItem(title: "Stretch for 10 Minutes"),
  ChallengeItem(title: "No Junk Food for a Day"),
  ChallengeItem(title: "Take the Stairs Instead of the Elevator"),
  ChallengeItem(title: "Go for a 30-Minute Cycle Ride"),
  ChallengeItem(title: "Do a 15-Minute HIIT Workout"),
  ChallengeItem(title: "Practice Deep Breathing for 5 Minutes"),
  ChallengeItem(title: "Dance for 10 Minutes"),
  ChallengeItem(title: "1 Hour of Silence"),
  ChallengeItem(title: "No Caffeine Intake for 5 Days")
];

  List<DietItem> diets = [
    DietItem(
        name: "Weight Loss Diet",
        details:
            "A diet plan focused on reducing calorie intake to promote weight loss.",
        steps: [
          "Reduce intake of sugars and starches.",
          "Eat protein, fat, and vegetables.",
          "Lift weights 3 times per week.",
          "Incorporate high-intensity interval training (HIIT).",
          "Drink plenty of water, especially before meals."
        ],
        warning:
            "Consult a healthcare provider before starting a weight loss diet, especially if you have any underlying health conditions."),
    DietItem(
        name: "Weight Gain Diet",
        details:
            "A diet plan designed to help you gain weight in a healthy manner.",
        steps: [
          "Eat more calories than your body burns.",
          "Eat plenty of protein.",
          "Eat a lot of carbs and fat, and eat at least 3 times per day.",
          "Lift heavy weights and improve your strength.",
          "Consume energy-dense foods and use sauces, spices, and condiments to make your food tastier."
        ],
        warning:
            "Avoid unhealthy junk foods and focus on nutrient-dense options to gain weight healthily."),
    DietItem(
        name: "Diet for Good Skin",
        details: "A diet plan that promotes healthy, glowing skin.",
        steps: [
          "Eat plenty of fruits and vegetables, especially those rich in antioxidants.",
          "Include healthy fats such as omega-3 fatty acids.",
          "Stay hydrated by drinking plenty of water.",
          "Limit sugar and refined carbohydrates.",
          "Consume foods rich in vitamins and minerals, like vitamin C, vitamin E, and zinc."
        ],
        warning: "Be mindful of any food allergies or sensitivities."),
    DietItem(
        name: "Keto Diet",
        details: "A low-carb, high-fat diet that offers many health benefits.",
        steps: [
          "Limit carbohydrate intake to 20-50 grams per day.",
          "Increase fat intake with foods like avocados, nuts, and seeds.",
          "Eat moderate amounts of protein.",
          "Focus on whole foods and avoid processed foods.",
          "Monitor your body's response and adjust your diet as needed."
        ],
        warning:
            "Consult a healthcare provider before starting the keto diet, especially if you have any underlying health conditions."),
    DietItem(
        name: "Mediterranean Diet",
        details:
            "A heart-healthy eating plan based on typical foods and recipes of Mediterranean-style cooking.",
        steps: [
          "Eat a variety of vegetables, fruits, whole grains, and healthy fats.",
          "Include fish and seafood in your diet at least twice a week.",
          "Limit red meat and sweets.",
          "Use olive oil as your primary fat source.",
          "Stay active and enjoy meals with family and friends."
        ],
        warning: "Ensure you get enough protein and other essential nutrients.")
  ];