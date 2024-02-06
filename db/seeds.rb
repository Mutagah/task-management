puts "Seeding of the database tables..."

    status = ["Pending", "Completed", "Cancelled"]

        puts "Seeding of task data...."

        Task.create!(name:"CV review",description:"Revamping of resume/cv",status: status.sample)

        Task.create!(name:"Test your api endpoints", description:"Test proper working of task endpoints and routes",status:status.sample)

puts "End of seeding database tables!!!"