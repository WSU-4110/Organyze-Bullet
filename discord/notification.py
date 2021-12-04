
from dateutil import parser, tz
import datetime
from datetime import timezone
import time
import math

class notification:
    """
     In a context menu next to a bullet in a notebook, or by using a Discord bot command, a user can specify how they would like to be reminded (via Push Notifications, a connected Discord Bot, or through a collaborator). Users can assign multiple reminders to a bullet.
     
    :param target: The target for the notification
    :type target: list

    :param time: The notification time as a POSIX timestamp.
    :type time: float

    :param task_id: The ID number associated with the task.
    :type task_id: str

    :param notif_id: The ID number associated with the notification
    :type notif_id: str

    
    """

    def __init__(self, time: float, task_id: str, target: list=None):
        self.time = time
        self.task_id = task_id
        self.target = target
      
    def get_time(self):
        parsed_time = parser.parse(self.time)
        parsed_time = parsed_time.replace(
          tzinfo=datetime.timezone.utc).timestamp()
    
        return parsed_time
    

    def calculate_time_delta(self):
        user_input_timestamp = self.get_time() 
        current_timestamp = self.current_timestamp()
              
        time_delta_in_seconds = user_input_timestamp - current_timestamp

        return time_delta_in_seconds
      

    def current_timestamp(self):
        now = datetime.datetime.now()
        timestampStr = now.strftime("%c")
        parsed_time = parser.parse(timestampStr)
        parsed_time = parsed_time.replace(
          tzinfo=datetime.timezone.utc).timestamp()
        return parsed_time
        

    def discord_notification(self):
      seconds = self.calculate_time_delta()
      return seconds
      

    


    

  

  

    

    





    

    
      
            

    

    

    
