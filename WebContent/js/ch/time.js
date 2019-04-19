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
		Day[0] = "星期天";
		Day[1] = "星期一";
		Day[2] = "星期二";
		Day[3] = "星期三";
		Day[4] = "星期四";
		Day[5] = "星期五";
		Day[6] = "星期六";
		var timeValue = "";
		timeValue += year + "年";
		timeValue += ((month < 10) ? "0" : "") + month + "月";
		timeValue += ((date < 10) ? "0" : "") + date + "日  ";
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