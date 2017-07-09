# Nested data structure of hypothetical airport

kitchen = {

  terminal_a: {
    pretty_name: 'Terminal A',
    facilities: {
      number_of_bathrooms: 6,
      smoking_lounge: false
    },
    airlines: [
      'El Al',
      'Alitalia'
      ],
    restaurants: [
      'Cafe Intermezzo',
      'Chick-fil-A',
      'Sushi Maki'
    ]
  },

  terminal_b: {
    pretty_name: 'Terminal B',
    facilities: {
      number_of_bathrooms: 8,
      smoking_lounge: true
    },
    airlines: [
      'United',
      'Alaska Airlines'
      ],
    restaurants: [
      'Five Guys',
      'Potbelly',
      'Starbucks'
    ]
  },

  terminal_c: {
    pretty_name: 'Terminal C',
    facilities: {
      number_of_bathrooms: 5,
      smoking_lounge: true
    },
    airlines: [
      'American',
      'Jet Blue'
      ],
    restaurants: [
      'Burger King',
      'Cinnabon'
    ]
  }

}

puts kitchen[:terminal_a][:facilities][:smoking_lounge]
puts kitchen[:terminal_b][:airlines]
puts kitchen[:terminal_b][:facilities][:number_of_bathrooms]
puts kitchen[:terminal_c][:pretty_name]
puts kitchen[:terminal_c][:airlines][0]
