---
marp: true
theme: dracula
class: invert
style: |
  img[alt~="diagram"] {
    display: block;
    padding-top: 10px;
  }
---

<style scoped>
  section.diagram img {
    margin-top: 10px;
  }
</style>

# CF INTRO: QUESTIONS

![bg right fill brightness:0.9](./questions.webp)

---

1. Реальні відгуки за і проти.
2. Основні маркери, щоб дізнатися, коли це реально необхідно, а коли надлишково.
3. Реальні кейси застосування цієї архітектури?
4. Скільки команд було залучено, чи використовувалися всі переваги, такі як деплой окремих модулів?
5. Наскільки вона була гнучкою і чи доводилося повністю змінювати модулі, наскільки вони насправді були pluggable у shell-контейнері?
6. Чи використовувалися різні технологічні стеки, і наскільки це було доцільно, адже фінальний бандл буде великим?

---

7. Якщо я правильно зрозумів зі статі то ця концепція опираєтсья на SSR. Чому?
8. Які переваги Composable Frontend. Де я можу використовувати та з якими бібліотеками або фреймворками. Який бекграунд потрібен для того щоб почати працювати з цієї концепцією. Хочеться побачити приклади, хоча б поверхневі.
9. Підводні камені Composable Frontend? Коли точно не треба використовувати цей підхід?
10. Що треба підготувати чи перевірити для використання Composable Frontend?

---

11. Інструменти які допомагають в створенні та підтримці Composable Frontend
12. Який найпростіший перший крок, щоб зробити існуючий моноліт більш компонуємим?
13. Пекрспективи розвитку microfrontend та Module federation 
14. Яка альтернатива microfrontend архітектурі? 
15. Can you discuss the key advantages of adopting a Composable Frontend approach over a Microfrontend architecture, particularly in terms of scalability, maintainability, and integration with business workflows?

---

16. Best practices for defining and documenting modular components' interdependencies and business requirements (Composable Frontend approach) to ensure their reusability and alignment with overall system goals.
17. Цікаво дізнатись про інші тули, оскільки користувалась на проекті лише Spartacus, порівняти.
18. Якщо використовувати Composable Frontend не з "коробки" або ж розширювати готове рішення, як не переускладнити код і не отримати проблеми з перформансом та гнучкістю.
