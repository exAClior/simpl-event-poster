#let poster(
	year: "",
	website: "",
  title: "",
  subtitle: "",
  date: "",
  logo: none,
	locations: none, 
	sponsors: none,
	page_width: 12in,
	page_height: 36in,
  body
) = {
	
  // Define color theme
  let backgroundColor = rgb("#FFFFFF") // White background
  let primaryColor = rgb("#2C3E50")    // Dark Blue for headers and accents
  let secondaryColor = rgb("#95A5A6")  // Light Gray for secondary text
  let accentColor = rgb("#E74C3C")     // Red for highlights

  // Set the page size and background color
  set page(width: page_width, height: page_height, margin: 0in, fill: backgroundColor)
  
  // Set up basic text styles
  set text(font: "Arial", size: 24pt, fill: primaryColor)
  
  // Header
  // Header with two-column layout
	place(top, dx:20pt, dy:30pt)[

		#grid(columns:(60%, 25%), rows:(150pt, 150pt),
		row-gutter: 20pt,column-gutter: 20pt,
			// fill: accentColor,
			grid.cell(rowspan:2,colspan:1,image("logo.png", width: 6in)),		
			// need to make this rounder and of different propotion
			grid.cell(fill:accentColor, text(website, size:30pt)),
			grid.cell(text(year, size:100pt)),
		)
	]
  
	// event general information: date, location, speakers etc

	place(center + horizon)[
		#box(fill: accentColor,width: 100%, height: 70%, 
			body
		)
	 ]

	// general topics

	place(center + horizon, dy: 950pt)[
		#box(fill: secondaryColor,width: 100%, height: 10%, 
			body
		)

	]
  
  
  // Sponsor's logos 
	// need to input this manually https://forum.typst.app/t/is-there-a-way-to-retrieve-the-current-file-name-list-files-etc-within-typst/155

	let sponsor_logos =  ()

	for sponsor_logo in sponsors {
		// how to use map here?
		sponsor_logos.push(image("sponsors/" + sponsor_logo, width: 3in))
	}

  place(bottom+center)[
    // List sponsor logos
    #grid(
        columns: sponsor_logos.len(), 
        align: center + horizon,
				gutter: 3pt,
				..sponsor_logos,
    )
  ]
}

// Usage example with updated color theme and sponsors
#show: poster.with(
	year: "2024",
  title: "Your Conference 2023",
  subtitle: "Exploring New Horizons",
  date: "July 15-17, 2023",
  locations: ["Tech City Convention Center"],
  logo: "logo.png",
	sponsors: ("sponsor1.svg", "sponsor2.svg", "sponsor3.svg"),
  website: "https://cn.julialang.org/meetup-website/2024"
)

= Event Information 

I should include event location and time here

= Speakers  

I should include speaker list here

= Topics 

How can I put this in the second section?
