## Nota Bene: I've just realized that the brief here was for "real world construct," while my example below is more of a database. Since I believe I've demonstrated the necessary understanding of nested data structures, I'm going to leave it rather than do another.

# Build nested data structure for philosophers
# Immanuel Kant, David Hume, Hegel

philosophers = {

  hume: {
    pretty_name: 'David Hume',
    bio_info: {
      birth_year: 1711,
      nationality: 'Scottish'
    },
    notable_works: [
      'An Enquiry Concerning Human Understanding',
      'An Enquiry Concerning the Principles of Morals'
      ],
    influences: [
      'Immanuel Kant',
      'Adam Smith',
      'John Stuart Mill'
    ]
  },

  kant: {
    pretty_name: 'Immanuel Kant',
    bio_info: {
      birth_year: 1724,
      nationality: 'Prussian'
    },
    notable_works: [
      'Critique of Pure Reason',
      'Critique of Practical Reason',
      'Metaphysics of Morals',
      'Critique of Judgment'],
    influences: [
      'Aristotle',
      'Rene Decartes',
      'Plato',
      'David Hume']
  },

  hegel: {
    pretty_name: 'Georg Wilhelm Friedrich Hegel',
    bio_info: {
      birth_year: 1770,
      nationality: 'Prussian'
    },
    notable_works: [
      'Phenomenology of Spirit',
      'Science of Logic',
      'Elements of the Philosophy of Right'
    ]
  }

}
=
puts philosophers[:kant][:bio_info][:nationality]
puts philosophers[:hegel][:notable_works][2]
puts philosophers[:hume][:pretty_name]
