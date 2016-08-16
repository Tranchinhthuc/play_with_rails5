class SysConst
  PART_1_2_OPTIONS = {
    "A" => 1,
    "B" => 2,
    "C" => 3
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
    part_three: 3,
    part_four: 3,
    part_five: 1,
    part_six: 3,
    part_seven_one: 2,
    part_seven_two: 5
  }

  OPTION_TO_STRING = ["A", "B", "C", "D"]

  TABLE_NAME = ["part_ones", "part_twos", "part_threes", "part_fours", "part_fives",
                "part_sixes", "part_seven_ones", "part_seven_twos"]
end
