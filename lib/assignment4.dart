import 'package:observe/observe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organyzebullet_app/screens/home-screen.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:organyzebullet_app/database/realtime_database_function.dart';
import 'package:organyzebullet_app/database/dataModel.dart';
import 'package:organyzebullet_app/database/message_dao.dart';



interface Observer{
  public void update(string task);
}


interface Subject {
  public void registerObserver(Observer observer);
  public void removeObserver(Observer observer);
  public void notifyObservers();
}

class ReminderStation implements Subject {
  private List<Observer> _observers;
  private string reminder;

  ReminderData() {
    _observers = [];
  }

  public getReminder(){
    return reminder;
  }

  public setReminder(string reminder){
    this.reminder = reminder;
    notifyObservers();
  }

  Override
  public void registerObserver(Observer observer) {
    observers.add(observer);
  }

  @Override
  public void removeObserver(Observer observer) {
    observers.remove(observer);
  }

  @Override
  public void notifyObservers() {
    for (Observer ob : observers) {
     ob.update(this.interest);
    }
  }
{


class reminder implements Observer {

  @Override
  update(string reminder){
  async with aiohttp.ClientSession() as session:
        target_ref = f"{db_ref[:-5]}/{task_id}.json"
        async with session.get(target_ref) as r:
            if r.status == 200:
                server_json = await r.json()
                task_description = server_json["name"]
                # await ctx.send(f"found the {task_description}.")
            else:
                ctx.send(f"{task_id} does not exist on the server.")

            converted_time = convert(time)

            #if converted_time == -1:
            #await ctx.send("Error. You did not enter the time correctly.")
            #return

            #if converted_time == -2:
            #await ctx.send("Error, the time must be an integer.")

            response = f"{time} reminder set for **{task_description}**."
            await ctx.send(response)
            await asyncio.sleep(converted_time)
            await ctx.send(
                f"{ctx.author.mention}, this is your reminder for **{task_description}**."
  }
}