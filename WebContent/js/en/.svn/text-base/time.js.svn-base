var timerRunning = false;
	startclock();
	function startclock() {
		stopclock();
		showtime();
	}
	function stopclock() {
		if (timerRunning)
			clearTimeout(timerID);
		timerRunning = false;
	}
	function MakeArray(size) {
		this.length = size;
		for ( var i = 1; i <= size; i++) {
			this[i] = "";
		}
		return this;
	}
	function stopclock() {
		if (timerRunning)
			clearTimeout(timerID);
		timerRunning = false;
	}
	function showtime() {
		var now = new Date();
		var year = now.getFullYear();
	
		var month = now.getMonth() + 1;
		var date = now.getDate();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		var day = now.getDay();
		Day = new MakeArray(7);
		Day[0] = "Sunday";
		Day[1] = "Monday";
		Day[2] = "Tuesday";
		Day[3] = "Wednesday";
		Day[4] = "Thursday";
		Day[5] = "Friday";
		Day[6] = "Saturday";
		var timeValue = "";
		timeValue += ((month < 10) ? "0" : "") + month + "/";
		timeValue += ((date < 10) ? "0" : "") + date + "/";
		timeValue += year + " ";
		timeValue += (Day[day]) + "  ";
		timeValue += ((hours < 10) ? "0" : "") + hours;
		timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
		timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
		var mytime = document.getElementById("mytime");
		if (mytime != null) {
			mytime.innerHTML = timeValue;
		}
		timerID = setTimeout("showtime()", 1000);
		timerRunning = true;
	}