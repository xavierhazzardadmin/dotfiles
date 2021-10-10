package main

import "github.com/kataras/go-mailer"

func main() {
	// sender configuration.
	config := mailer.Config{
		Host:     "smtp.mailgun.org",
		Username: "postmaster",
		Password: "38304272b8ee5c176d5961dc155b2417",
		FromAddr: "postmaster@sandbox661c307650f04e909150b37c0f3b2f09.mailgun.org",
		Port:     587,
		// Enable UseCommand to support sendmail unix command,
		// if this field is true then Host, Username, Password and Port are not required,
		// because these info already exists in your local sendmail configuration.
		//
		// Defaults to false.
		UseCommand: false,
	}

	// initalize a new mail sender service.
	sender := mailer.New(config)

	// the subject/title of the e-mail.
	subject := "Hello subject"

	// the rich message body.
	content := `<h1>Hello</h1> <br/><br/> <span style="color:red"> This is the rich message body </span>`

	// the recipient(s).
	to := []string{"kataras2006@hotmail.com", "social@ideopod.com"}

	// send the e-mail.
	err := sender.Send(subject, content, to...)

	if err != nil {
		println("error while sending the e-mail: " + err.Error())
	}
}
