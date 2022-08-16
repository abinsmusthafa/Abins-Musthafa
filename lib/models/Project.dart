class Project {
  final String? title, description,associated,appstoreLink;

  Project({this.title, this.description,this.associated,this.appstoreLink});
}

List<Project> demo_projects = [
  Project(
    title: "Ideal Food Basket",
    description:
        "Online grocery store App in the U.S. Listing the Grocery products based on Stores and Category wise. User have an option to search products. Delivery Address choose from Google map and Stripe payment",
    associated: "Cognetry Labs Inc",
    appstoreLink: "https://apps.apple.com/in/app/ideal-food-basket/id1611694264"

  ),
  Project(
    title: "Craft Concierge",
    description:
        "Online Restaurant, liquor and Merchandise Items Store in the U.S.  Listing the Grocery products based on Stores and Category wise.  User have an option to search products. Delivery Address choose from Google map and Stripe payment",
      associated: "Cognetry Labs Inc",
      appstoreLink: "https://apps.apple.com/us/app/craft-concierge/id1618753070"
  ),
  Project(
    title: "Assistplus - for office",
    description:
        "Assistplus lets you keep track of the movement paths of employees within the office premises so that you can analyze the time spent by employees during office time.",
      associated: "Pinmicro India Pvt.",
      appstoreLink: "https://apps.apple.com/us/app/assistplus-for-office/id1498588610"
  ),
  Project(
    title: "Eduplus",
    description:
        "Eduplus is an IoT enabled smart digital solution that helps school management to manage and track end-to-end administrative and CRM processes and parents to keep track of child location and activity in schools.",
      associated: "Pinmicro India Pvt.",
      appstoreLink: "https://apps.apple.com/us/app/eduplus-keep-your-kid-safe/id1384509233"
  ),
  Project(
    title: "Kochi Design Week",
    description:
        "KDW consists of an array of independent events stitched together with design thread. Inquisitive individuals can learn and interact through workshops, panel discussions, keynote speeches, exhibitions, and many more organized as a part of the design week where they can listen and discuss with the industry experts on the future of design.",
      associated: "Pinmicro India Pvt.",
      appstoreLink: "https://apps.apple.com/us/app/kochi-design-week/id1487113946"
  ),
];
