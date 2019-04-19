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
		Day[0] = "일요일";
		Day[1] = "월요일";
		Day[2] = "화요일";
		Day[3] = "수요일";
		Day[4] = "목요일";
		Day[5] = "금요일";
		Day[6] = "토요일";
		var timeValue = "";
		timeValue += year + "년";
		timeValue += ((month < 10) ? "0" : "") + month + "월 ";
		timeValue += ((date < 10) ? "0" : "") + date + "일  ";
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