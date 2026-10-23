/* ==========================================================
   Portfólio · Bianca Vieira
   >>> EDITE AQUI seus dados de contato <<<
   ========================================================== */
const CONFIG = {
  // Troque pelo link do seu perfil, por exemplo: "https://www.instagram.com/seu_usuario"
  instagram: "https://www.instagram.com/",
};

/* ---------- Contato ---------- */
document.getElementById("instagram-link").href = CONFIG.instagram;

/* ---------- Ano no rodapé ---------- */
document.getElementById("ano").textContent = new Date().getFullYear();

/* ---------- Menu mobile ---------- */
const toggle = document.querySelector(".nav__toggle");
const menu = document.getElementById("menu");

function setMenu(open) {
  menu.classList.toggle("open", open);
  toggle.setAttribute("aria-expanded", String(open));
  toggle.setAttribute("aria-label", open ? "Fechar menu" : "Abrir menu");
}
toggle.addEventListener("click", () => setMenu(!menu.classList.contains("open")));
menu.querySelectorAll("a").forEach((a) => a.addEventListener("click", () => setMenu(false)));
document.addEventListener("keydown", (e) => { if (e.key === "Escape") setMenu(false); });

/* ---------- Animação de entrada ao rolar ---------- */
const revealTargets = document.querySelectorAll(".reveal, .meter");

if ("IntersectionObserver" in window) {
  const io = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("in");
        io.unobserve(entry.target);
      }
    });
  }, { threshold: 0.15 });
  revealTargets.forEach((el) => io.observe(el));
} else {
  revealTargets.forEach((el) => el.classList.add("in"));
}
