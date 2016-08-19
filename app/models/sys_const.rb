class SysConst
  PART_2_OPTIONS = {
    "A" => 1,
    "B" => 2,
    "C" => 3,
  }

  PART_1_OPTIONS = {
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "D" => 4
  }

  QUESTION_LEVELS = {
    less_than_300: 1,
    from_300_to_450: 2,
    from_450_to_600: 3,
    from_600_to_750: 4,
    greater_than_750: 5
  }

  QUESTION_LEVELS_TO_S = {
    less_than_300: "0-300",
    from_300_to_450: "300-450",
    from_450_to_600: "450-600",
    from_600_to_750: "600-750",
    greater_than_750: "750-990",
  }

  NUMBER_OF_SUB_QUESTIONS = {
    part_one: 1,
    part_two: 1,
    part_three: 3,
    part_four: 3,
    part_five: 1,
    part_six: 3,
    part_seven_one: 2,
    part_seven_two: 5
  }

  OPTION_TO_STRING = ["A", "B", "C", "D"]

  PART_TWO_OPTION_TO_STRING = ["A", "B", "C"]

  TABLE_NAME = ["part_ones", "part_twos", "part_threes", "part_fours", "part_fives",
                "part_sixes", "part_seven_ones", "part_seven_twos"]

  QUESTION_TYPE_TO_STRING = {
    part_one: "Photo",
    part_two: "Question-Response",
    part_three: "Short conversation",
    part_four: "Short Talks",
    part_five: "Incomplete Sentences",
    part_six: "Text Completion",
    part_seven_one: "Single passage",
    part_seven_two: "Double passage"
  }

  COUNT_OF_OPTIONS = {
    part_one: 4,
    part_two: 3,
    part_three: 4,
    part_four: 4,
    part_five: 4,
    part_six: 4,
    part_seven_one: 4,
    part_seven_two: 4
  }

  LISTENING_TYPES = [:part_one, :part_two, :part_three, :part_four]
  READING_TYPES = [:part_five, :part_six, :part_seven_one, :part_seven_two]
  HAS_MANY_SUB_QUESTIONS = [:part_three, :part_four, :part_six, :part_seven_one, :part_seven_two]
end
