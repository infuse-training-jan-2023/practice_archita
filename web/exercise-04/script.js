const user = {
    name: "Piyush Sharma",
    designation: "Senior Software Engineer",
    company: "Infuse Consulting",
    hobbies: ["Reading", "Listening to music", "Collecting stamps"]
}

/**
 * Use destructuting to log the following
*/

const printUserProfile = () => {
    // Piyush Sharma is a Senior Software Engineer at Infuse Consulting. He likes Reading, Listening to music and Collecting stamps
    let {name, designation, company, hobbies} = user
    let all_hobbies = ""
    hobbies.forEach((hobby, index) => {
        if(index == hobbies.length - 2)
            all_hobbies += hobby + ' and '
        else if(index == hobbies.length - 1)
            all_hobbies += hobby 
        else 
            all_hobbies += hobby + ', '
    })
    console.log(`${name} is a ${designation} at ${company}. He likes ${all_hobbies}`);
}

printUserProfile()

