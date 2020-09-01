const AuthArmorSDK = require('autharmor-sdk');
const SDK = new AuthArmorSDK("http://127.0.0.1:3001/v1");

const register = async (username) => {
	var user = {
		username: $("#username").val(),
	}
	$.post('/users/create', user);
	// Generate a new invite
	try {
		const invite = await SDK.invite.generateInviteCode({
			nickname: username, // Specify the invite's nickname
			referenceId: "myreference" // Specify a reference ID for the invite
		});
		console.log("Getting invite QR code and link.");
		console.log("QR code base64 data: ", invite.getQRCode());
		console.log("Full invite response: ", invite);
		document.getElementById("username").value = invite.nickname;
		document.getElementById("qrcode").src = invite.getQRCode();
		document.getElementById("status_message").style.display = "none";
		document.getElementById("qrcode_and_link").style.display = "inline";
		document.getElementById("invite_link").href = invite.getInviteLink();
	} catch(err) {
		console.log("An error has occurred!", err.errorMessage);
		document.getElementById("status_message").innerHTML = err.errorMessage;
		document.getElementById("status_message").style.display = "inline";
	}
};

const confirm = async (username) => {
	// Confirm an invite
	try {
		console.log("Confirming invite ID:", username);
		await SDK.invite.confirmInvite(username);
		console.log("Invite has been confirmed successfully!");
		document.getElementById("qrcode_and_link").style.display = "none";
		document.getElementById("status_message").innerHTML = "Your invite has been confirmed!";
		document.getElementById("status_message").style.display = "inline";
	} catch (err) {
		console.error("The request was declined or has timed out!", err.errorMessage);
		document.getElementById("status_message").innerHTML = err.errorMessage;
		document.getElementById("status_message").style.display = "inline";
	}
};

const authenticate = async (username) => {
	// Perform an authentication
	try {
		console.log("Authenticating user:", username);
		await SDK.auth.authenticate(username);
		console.log("User authenticated!");
		document.getElementById("qrcode_and_link").style.display = "none";
		document.getElementById("status_message").innerHTML = "You were logged in successfully!";
		document.getElementById("status_message").style.display = "inline";
	} catch (err) {
		console.error("The request was declined or has timed out!", err.errorMessage);
		document.getElementById("status_message").innerHTML = err.errorMessage;
		document.getElementById("status_message").style.display = "inline";
	}
};