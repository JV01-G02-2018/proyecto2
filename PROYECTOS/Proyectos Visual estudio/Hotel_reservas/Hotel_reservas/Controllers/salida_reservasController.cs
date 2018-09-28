using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Hotel_reservas.Models;

namespace Hotel_reservas.Controllers
{
    public class salida_reservasController : Controller
    {
        private Model1 db = new Model1();

        // GET: salida_reservas
        public ActionResult Index()
        {
            var salida_reservas = db.salida_reservas.Include(s => s.Reservas).Include(s => s.Usuario);
            return View(salida_reservas.ToList());
        }

        // GET: salida_reservas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            salida_reservas salida_reservas = db.salida_reservas.Find(id);
            if (salida_reservas == null)
            {
                return HttpNotFound();
            }
            return View(salida_reservas);
        }

        // GET: salida_reservas/Create
        public ActionResult Create()
        {
            ViewBag.id_reservas = new SelectList(db.Reservas, "id_reservas", "id_reservas");
            ViewBag.id_usuarios = new SelectList(db.Usuario, "id_usuario", "nombre");
            return View();
        }

        // POST: salida_reservas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_salida_reservas,observaciones,id_usuarios,id_reservas")] salida_reservas salida_reservas)
        {
            //consultas a las tablas
            Reservas rer = (from reser in db.Reservas where reser.id_reservas == salida_reservas.id_reservas select reser).First();
            Habitaciones habi = (from habita in db.Habitaciones where habita.id_habitaciones== rer.id_habitacion select habita).First();

            //condiciones
       if (habi.tipo == "habitacion doble")
            {
                habi.cantidad = habi.cantidad + rer.numero_habitaciones;
            }

            if (habi.tipo== "habitacion sencilla")
            {
                habi.cantidad = habi.cantidad + rer.numero_habitaciones;
            }

            else if (habi.tipo== "V.I.P")
            {
                habi.cantidad = habi.cantidad + rer.numero_habitaciones;
            }

    

            if (ModelState.IsValid)
            {
                db.salida_reservas.Add(salida_reservas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }



            if (ModelState.IsValid)
            {
                db.salida_reservas.Add(salida_reservas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_reservas = new SelectList(db.Reservas, "id_reservas", "id_reservas", salida_reservas.id_reservas);
            ViewBag.id_usuarios = new SelectList(db.Usuario, "id_usuario", "nombre", salida_reservas.id_usuarios);
            return View(salida_reservas);
        }

        // GET: salida_reservas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            salida_reservas salida_reservas = db.salida_reservas.Find(id);
            if (salida_reservas == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_reservas = new SelectList(db.Reservas, "id_reservas", "id_reservas", salida_reservas.id_reservas);
            ViewBag.id_usuarios = new SelectList(db.Usuario, "id_usuario", "nombre", salida_reservas.id_usuarios);
            return View(salida_reservas);
        }

        // POST: salida_reservas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_salida_reservas,observaciones,id_usuarios,id_reservas")] salida_reservas salida_reservas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(salida_reservas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_reservas = new SelectList(db.Reservas, "id_reservas", "id_reservas", salida_reservas.id_reservas);
            ViewBag.id_usuarios = new SelectList(db.Usuario, "id_usuario", "nombre", salida_reservas.id_usuarios);
            return View(salida_reservas);
        }

        // GET: salida_reservas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            salida_reservas salida_reservas = db.salida_reservas.Find(id);
            if (salida_reservas == null)
            {
                return HttpNotFound();
            }
            return View(salida_reservas);
        }

        // POST: salida_reservas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            salida_reservas salida_reservas = db.salida_reservas.Find(id);
            db.salida_reservas.Remove(salida_reservas);
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
