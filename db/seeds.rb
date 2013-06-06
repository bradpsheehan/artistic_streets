file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/001/medium/02143_03.jpg'))
art1 = Art.create!(title: "Peace, Obey", artist: "Shepard Fairey", image: file, location_attributes: { address: '2-98 Oak Terrace, Somerville, MA 02143'})
puts "added first file"

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/002/medium/02108_01.jpg'))
art2 = Art.create!(title: "Latta Brothers Memorial Pool", image: file, location_attributes: { address: '20 McGrath Hwy, Somerville, MA 02108'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/003/medium/02143_01.jpg'))
art3 = Art.create!( image: file, location_attributes: { address: '84-98 Lowell St, Somerville, MA 02143'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/004/medium/02143_04.jpg'))
art4 = Art.create!(title: "Somerville Immigrants' Mural", artist: "Be Sargent", image: file, location_attributes: { address: '10-34 Park St, Somerville, MA 02143'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/005/medium/02143_05.jpg'))
art5 = Art.create!( image: file, location_attributes: { address: 'Osgood Park, Somerville, MA 02143'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/006/medium/02143_07.jpg'))
art6 = Art.create!(title: "Obey", artist: "Shepard Fairey", image: file, location_attributes: { address: '13-39 Carlton St, Somerville, MA 02143'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/007/medium/02143_08.jpg'))
art7 = Art.create!(title: "Fringe Union", artist: "Caleb Neelon", image: file, location_attributes: { address: '11-99 Hawkins St, Somerville, MA 02143'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/008/medium/02143_10.jpg'))
art8 = Art.create!(title: "Somerville Gateway Mural", artist: "Be Sargent", image: file, location_attributes: { address: '65 Union Square, Somerville, MA 02143'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/009/medium/02144_01.jpg'))
art9 = Art.create!(title: "The Saginaw Ave. Mural Cooperative (behind Shaws)", image: file, location_attributes: { address: '47-99 Davenport St, Somerville, MA 02144'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/010/medium/02143_09.jpg'))
art10 = Art.create!(artist: "Os Gemeos", image: file, location_attributes: { address: '2-18 Webster Ave, Somerville, MA 02143'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/011/medium/02145_01.jpg'))
art11 = Art.create!(image: file, location_attributes: { address: '320 Broadway, Somerville, MA 02145'})

file = open(URI.parse('https://s3-us-west-2.amazonaws.com/artisticstreets/arts/images/000/000/012/medium/02145_02.jpg'))
art12 = Art.create!(image: file, location_attributes: { address: '299 Broadway, Somerville, MA 02145'})

# # file = open('artistic-streets.herokuapp.com/assets/images/seed_photos/02143_02.jpg')
# # art1 = Art.create(title: "Remembering the Young People We've Lost…", image: file, location_attributes: { address: 'Morse Kelley Park, Somerville, MA 02143'})
# #

# # file = open('artistic-streets.herokuapp.com/assets/images/seed_photos/02143_11.jpg')
# # art1 = Art.create(image: file, location_attributes: { address: '59 Washington St, Somerville, MA 02143'})
# #
