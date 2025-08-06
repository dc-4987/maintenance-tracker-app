# Features

✅ MVP Feature Set for Your Maintenance Tracker App

1. Tool & Equipment Management
	•	Add a new tool or vehicle with:
	•	Name, type (vehicle, chainsaw, mower, etc.)
	•	Purchase date (optional)
	•	Photo (optional)
	•	Usage unit (hours, km, miles, etc.)
	•	Current usage total
	•	Tag with categories (e.g., “garden,” “power tool,” “vehicle”)

✏️ This helps organize and track different types of equipment without overcomplication.

⸻

2. Preventative Maintenance Task System
	•	Add recurring maintenance tasks like:
	•	“Sharpen chain” every 10 hours
	•	“Oil change” every 6 months or 5,000 miles
	•	Each task includes:
	•	Task title + description
	•	Frequency: by time, usage, or both
	•	Tool/material checklist (e.g., oil type, file size)
	•	Reminder toggle

💡 This is the heart of the app. Let users define tasks once and get reminded reliably.

⸻

3. Smart Reminders
	•	Local notifications triggered by:
	•	Time elapsed (via flutter_local_notifications)
	•	Usage logged (when usage meets or exceeds threshold)
	•	Ability to snooze or dismiss reminders
	•	Show due/overdue tasks on the home screen

⸻

4. Usage Logging
	•	Quick way (from home screen) to:
	•	Log hours/miles for a tool
	•	Automatically update associated task reminders
	•	Recent logs shown in a scrollable history

🏁 Example: “Used lawnmower for 1.5h today” — tap, done.

⸻

5. Task Material Checklist
	•	Every maintenance task has an attached checklist:
	•	Tools (e.g., socket wrench)
	•	Parts (e.g., oil filter)
	•	Supplies (e.g., 1L of SAE 30 oil)
	•	Helps prep ahead of time so nothing is forgotten

⸻

6. Home Screen Overview
	•	Show:
	•	Today’s or upcoming maintenance
	•	Tools due for usage updates
	•	Quick log input buttons (“+ Usage”, “+ Task Done”)
	•	Optional: Show total number of active tools, overdue tasks

⸻

# Additional features

- Upload image of tool which will:
    - log the type of tool/vehicle/equipment
    - create a preventative maintenance list of tasks