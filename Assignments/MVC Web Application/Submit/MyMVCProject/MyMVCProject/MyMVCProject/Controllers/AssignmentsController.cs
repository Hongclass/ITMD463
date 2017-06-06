using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MyMVCProject.Models;

namespace MyMVCProject.Controllers
{
    public class AssignmentsController : Controller
    {
        private VolunteerData_1Entities db = new VolunteerData_1Entities();

        // GET: Assignments
        public ActionResult Index()
        {
            var assignments = db.Assignments.Include(a => a.Event).Include(a => a.Volunteer);
            return View(assignments.ToList());
        }

        // GET: Assignments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Assignment assignment = db.Assignments.Find(id);
            if (assignment == null)
            {
                return HttpNotFound();
            }
            return View(assignment);
        }

        // GET: Assignments/Create
        public ActionResult Create()
        {
            ViewBag.EventID = new SelectList(db.Events, "EventID", "Description");
            ViewBag.VolunteerID = new SelectList(db.Volunteers, "VolunteerID", "LastName");
            return View();
        }

        // POST: Assignments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AssignmentID,EventID,VolunteerID")] Assignment assignment)
        {
            var e = db.Events.Find(assignment.EventID);
            var v = db.Volunteers.Find(assignment.VolunteerID);

            string error = null;

            bool found = false;
            foreach (Assignment a in v.Assignments)
            {
                if (a.EventID == assignment.EventID)
                {
                    found = true;
                    break;
                }
            }
            if (found)
            {
                error = "This Assignment already exists.";
            }
            else
            {
                Event overlapped = null;
                foreach (Assignment a in v.Assignments)
                {
                    if (a.Event.overlappedWith(e))
                    {
                        overlapped = a.Event;
                    }
                }
                if (overlapped != null)
                {
                    error =String.Format( "This assignment conflicts with this event {0}, start:{1}, end:{2} ", overlapped.Location, overlapped.StartDate, overlapped.EndDate);
                }
            }

            if (ModelState.IsValid && error == null)
            {
                db.Assignments.Add(assignment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            if (error != null)
            {
                this.ModelState.AddModelError("VolunteerID", error);
            }
            ViewBag.EventID = new SelectList(db.Events, "EventID", "Description", assignment.EventID);
            ViewBag.VolunteerID = new SelectList(db.Volunteers, "VolunteerID", "LastName", assignment.VolunteerID);
            return View(assignment);
        }

        // GET: Assignments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Assignment assignment = db.Assignments.Find(id);
            if (assignment == null)
            {
                return HttpNotFound();
            }
            ViewBag.EventID = new SelectList(db.Events, "EventID", "Description", assignment.EventID);
            ViewBag.VolunteerID = new SelectList(db.Volunteers, "VolunteerID", "LastName", assignment.VolunteerID);
            return View(assignment);
        }

        // POST: Assignments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AssignmentID,EventID,VolunteerID")] Assignment assignment)
        {
            // original data
            if (ModelState.IsValid)
            {
                db.Entry(assignment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EventID = new SelectList(db.Events, "EventID", "Description", assignment.EventID);
            ViewBag.VolunteerID = new SelectList(db.Volunteers, "VolunteerID", "LastName", assignment.VolunteerID);
            return View(assignment);
        }

        // GET: Assignments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Assignment assignment = db.Assignments.Find(id);
            if (assignment == null)
            {
                return HttpNotFound();
            }
            return View(assignment);
        }

        // POST: Assignments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Assignment assignment = db.Assignments.Find(id);
            db.Assignments.Remove(assignment);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
