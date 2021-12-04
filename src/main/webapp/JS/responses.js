function getBotResponse(input) {
    // Converting input instring
    // const input = stringInput.split('')

    // if (input.includes("guidelines") || input.includes("guideline")) {
    //     return "<b>User guidelines </b><br>1. In order to rent and sell products users must be registered.<br>" +
    //         "2. Users will have to be registered to contact for complaints<br>" +
    //         "3. Products rented must be in good condition when returned <br>" +
    //         "4. Users must have a driver licsene to rent";
    //
    //
    // } else
    if (input.includes("help")) {
        return "Hi, what do you need help with? <br>" +
            " &bull; sign-up <br>" +
            " &bull; rent product<br>" +
            "&bull; upload product<br>" +
            "&bull; file complaint <br> " +
            "&bull; contact admin <br> " +
            "&bull; leave review";


    } else if (input.includes("sign") || input.includes("register")) {
        return "You can sign-up by going to our login page and sign-up using: <br> 1. Your Google Account <br> 2. Sign-up by creating an account for our website";

    } else if (input.includes("feedback") || input.includes("review")) {
        return "On the product details page click on 'Add review' button. A form will pop up in which you can write your review.";

    }else if (input.includes("complaint")) {
        return "On the product details page click on 'Submit Complaint' button. A form will pop up in which you can write your complaint regarding the product.";
    }
    else if (input.includes("uploading") || input.includes("upload") || input.includes("advertise")) {
        return "Click on the account tab on menu bar. Click 'Add Product' button to upload your product. " +
            "You will be redirected to a form where you have to enter product details. Enter appropriate details, select product image, then click on submit. " +
            "Once the admin approves your product, it will be available for others to rent.";
    }
    else if (input.includes("contact admin") || input.includes("admin")) {
        return "Please contact us using one of the following options: <br> " +
            "1. rentAll398@gmail.com <br> 2. Click on 'Feedback button' on the about us section or the footer. " +
            "A form will pop up where you can leave your queries or feedback.";
    }
    else if (input.includes("rent") || input.includes("buy")) {
        return "In order to rent a product please sign-in first. After successful login, the user can click on rent on product detail page. " +
            "After clicking on rent button, user will have to select a start and end date and then and estimate cost will be display based on the dates selected. " +
            "Then user can enter cards details and click on proceed. After successful renting the product will be added on user's renting list and the user will get a confirmation regarding the same.";
    }
    else if (input.includes("view products") || input.includes("view") || input.includes("browse") || input.includes("explore")) {
        return "To view the list of available products, click on the 'Products' tab on the top menu bar or click on the 'Explore Products' button on the homepage.";
    }
    else if (input.includes("services")) {
        return "Please check our 'Services' section on Homepage to see services provided by us. ";
    }
    else if (input.includes("sign out")) {
        return "To sign out click on the Logout button.";
    }
    else if (input.includes("cost") || input.includes("price")) {
        return "Depending on the product and duration of rent cost will be different.<br> Please see details when you checkout a product.";
    }
    else if (input.includes("about the company") || input.includes("tell me about you") || input.includes("about")) {
        return "Our team at RentALL is committed towards giving a convenient and hassle free renting service to the user." +
            "Please check our About Us section on the homepage to know more about our vision and mission.";

    }else if (input.includes("chat") || input.includes("message") || (input.includes("contact") && input.includes("seller")) ) {
        return "1. To start chatting with a seller, go to the product details page and click on 'chat' button. it will redirect you to a chat window where te seller will be the receiver.<br>" +
            "2. You can also view your recent chat history by clicking on 'Message' button on your Account page.";
    }
    else if (input.includes("bye")) {
        return "Hope to see you again!";
    }
    else {
        return "Sorry, I didn't get you.";
    }
}


// contact, feedback
// help - rent, uploading product, contact admin
// complaints
// guidelines
// products/ view products
