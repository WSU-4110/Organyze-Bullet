import unittest
import datetime
from datetime import timezone
import time
import math
from unittest.case import TestCase
from dateutil import parser, tz
import json

import os, sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from discord.notification import notification


class notificationTest(unittest.TestCase):
    
    def test_time(self):
        input = "Fri Dec 3 18:34:56 2021"
        notify_object = notification(input, "1234")
        self.assertEqual(notify_object.time, "Fri Dec 3 18:34:56 2021" )
    
    def test_id(self):
        input = "Fri Dec 3 18:34:56 2021"
        notify_object = notification(input, "1234")
        self.assertEqual(notify_object.task_id, "1234" )

    def test_get_time(self):
        input = "Fri Dec 3 18:34:56 2021"
        notify_object = notification(input, "1234")
        test_get_time = notify_object.get_time()
        self.assertEqual(test_get_time, 1638556496.0 )

    def test_calculate_time_delta(self):
        #current time subtracted by current time should be close to zero
        current_time = str(datetime.datetime.now())
        notify_object = notification(current_time, "1234")
        test = notify_object.calculate_time_delta()
        self.assertLessEqual(test, 1)
        self.assertGreaterEqual(test, 0)


    # def test_current_timestamp(self):
    #     #calculate current timestamp
    #     timestamp =  datetime.datetime.now()
    #     timestampStr = timestamp.strftime("%c")
    #     parsed_time = parser.parse(timestampStr)
    #     parsed_time = parsed_time.replace(
    #         tzinfo=datetime.timezone.utc).timestamp()

    #     input = "Fri Dec 3 18:34:56 2021"
    #     notify_object = notification(input, "1234")
    #     #calculate current timestamp using the class method
    #     test = notify_object.current_timestamp()
    #     #compare both timestamps
    #     self.assertEqual(test, parsed_time)

    # def test_discord_notification(self):
    #     input = "Fri Dec 3 18:34:56 2021"
    #     notify_object = notification(input, "1234")
    #     test = notify_object.discord_notification()
    #     self.assertLessEqual(test, 1)


    # def test2_discord_notification(self):
    #     input = "Fri Dec 30 18:34:56 2021"
    #     notify_object = notification(input, "1234")
    #     test = notify_object.discord_notification()
    #     self.assertGreaterEqual(test, 100)
    




    
                                    
        


if __name__ == '__main__':
    unittest.main()



