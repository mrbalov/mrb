---
layout: post
title: Organizing Modules in Big Projects — Loose Coupling and Tight Cohesion
date: 2024-12-12 12:00:00 +02:00
modified: 2024-12-12 12:00:00 +02:00
tags: [architecture, modularization]
description: Proper modularization is crucial, especially for big projects. This is the main thing that makes your project extensible. There are two important things that you should consider when making your system modular — coupling and cohesion.
excerpt: Proper modularization is crucial, especially for big projects. This is the main thing that makes your project extensible. There are two important things that you should consider when making your system modular — coupling and cohesion.
image: /assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/cover.webp
image_alt: Cover - Abstract Vision on Coupling and Cohesion by DALL-E AI.
image_caption: Illustration by <a href="https://openai.com/index/dall-e-3/" rel="noopener noreferrer" target="_blank">DALL-E</a>
tweet: 1877834515722244480
toc: true
---

## Problem

How do you organize system modules? I hope you place elements related to each other together (module) and then set up connections between those groups of elements. Right?

The principle described above allows you to design extensible applications. Formally, it sounds like the following:

> Organize system elements in a way that is decoupled and cohesive. I.e., prefer **loose coupling** and **tight cohesion**.

You may have already heard this rule. But have you ever wondered what it means and what real benefit it could provide? I suggest you dive deeper into these questions and gain a justification for following this precious rule.

## Terminology

The following terminology is important for gaining the right understanding of the ideas presented in the article.

- **Element.** It is a generic part of a system of any scale. A file, module, function, class, or anything else is a valid example of a system element. In the context of the article, you may imagine an element as an elementary thing like a *molecule*, as it is usually used as a reference to elementary parts of a system. [<sup>2</sup>](#references)
- **Module.** It is a group of more-or-less related elements encapsulated under a concise <abbr title="Application Programming Interface">API</abbr>. You can imagine a module as an *organ* built of molecules (elements). The same as an organ, a good module is responsible for doing one thing well. [<sup>1</sup>](#references) [<sup>2</sup>](#references)
- **Component.** It is a runtime version of a system element.
- **System.** A software system that is comprised of intercommunicating elements, the main goal of which is to deliver business value. Logically, you can imagine a system as a family of modules that make an *organism*. A usual organism is good at solving multiple tasks well, the same as good software systems do. [<sup>3</sup>](#references)
- **Low coupling** is the same as **Loose coupling**.
- **High cohesion** is the same as **Tight cohesion**.

## Context

### Foundational Concepts

When talking about modularization, we must always keep in mind the following foundational concepts:

- **DDD** - Domain-Driven Design. This is the classical concept from which everything starts. [<sup>9</sup>](#references)
- **SOA** — Service-Oriented Architecture. [<sup>4</sup>](#references)
- **Microservice Architecture.** It always goes hand-in-hand with the modularization problem. There are many different techniques for identifying the right service boundaries, almost the same as arranging the proper system modularization. [<sup>5</sup>](#references) [<sup>8</sup>](#references)
- **Micro Frontends.** It is similar to the Microservice Architecture, but for the frontend — when independent <abbr title="User Interface">UI</abbr> parts are gathered in a seamless application via some mediator. [<sup>6</sup>](#references)
- **Atomic Design.** Usually, it is applied to frontend development. However, in my opinion, its concepts are handy for designing systems with proper modularization that enables flexibility and extensibility. [<sup>7</sup>](#references)

When talking in terms of the Atomic Design, we usually start describing things from atoms rather than molecules, as I did above. It is done intentionally for several reasons. Firstly, there is no plan to fully follow the Atomic Design describing the modularization problems — it sounds like a separate topic that is worth a separate investigation. Secondly, atoms may be too small elements that I would like to neglect elaborating on such high-level concepts as system modularization.

Understanding these foundational concepts makes it easy to accept the importance of proper modularization. As the practice shows, this problem comes far beyond the technical field and dictates how we can arrange teams effectively on a scale.

Code examples in this article are based on the most popular frontend library — React. However, you can replace it with any other code, as only general concepts make sense. I.e., the proper modularization is equally important for frontend, backend, and any other kind of systems.

### Architectural Structures

There are the following 3 kinds of architectural structures: [<sup>2</sup>](#references)

1. **Module Structures.** Show how system elements (modules) are arranged. E.g., a directories tree is the simplest module structure.
2. **Component-and-Connector Structures.** Show how system components communicate with each other in the runtime. In terms of microservice architecture, a component is usually represented as a service.
3. **Allocation Structures.** Show how system elements are related to non-software things like teams, hardware, and others. E.g., when following the <abbr title="Domain-Driven Design">DDD</abbr>, a system is split into domains with responsible teams.

In this article, we plan to use only simplified module structures as the primary subject of investigation.

When working with system design improvements, you are always expected to understand given structures and visualize them as views. Otherwise, you will not be able to recognize the state of things in a system and plan a transition to the desired state properly.

## Coupling

Coupling is something like external connections between system elements. Tight coupling is when elements of a system have chaotic connections.

Technically, we can measure the value of coupling — this is the number of connections between system elements (functions, objects, modules, etc.). The rule states that a system should have the lowest possible number of connections. In this case, we can be sure that there are only expected connections, and we can manage them effectively.

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/coupling.webp" alt="Pic. 1. Coupling.">
<figcaption>Pic. 1. Coupling.</figcaption>
</figure>

For sure, there is no easy way to calculate the number of connections. Practically, it may not be useful for the development team — at least because it has a relative nature and can't say exactly whether the specific number of connections is good or bad.

Let’s imagine that we’ve calculated a number of connections some way and it’s “100”. Is it much or not? How can we use this number to improve a system? There is no clear answer.

Then, how to improve a system? Probably, the only adequate way is to follow the techniques we are gonna discuss below.

There is a simple and useful definition of coupling suggested by Sam Newman: [<sup>8</sup>](#references)

> Things are coupled when they change together.

## Cohesion

Cohesion is when elements of a system are grouped together by some criteria. Loose cohesion means that a system’s elements don’t have clear boundaries. From the first glance, such a system may look like a mess.

There are a lot of things we can call a “group”:

- Module
- Class
- React component (both class and functional)
- Namespace
- Service
- Domain
- And so on…

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/cohesion.webp" alt="Pic. 2. Cohesion.">
<figcaption>Pic. 2. Cohesion.</figcaption>
</figure>

It is important, because in a cohesive system there are much fewer connections between elements. This leads to better management of these connections and we may be more sure that they are expected.

As you can see, “coupling” and “cohesion” always go together.

Supporting the tight cohesion is the best option for decreasing the number of connections and making a system more manageable and extensible.

There is a simple and useful definition of cohesion suggested by Sam Newman: [<sup>8</sup>](#references)

> Things that change together, stay together.

## Coupling and Cohesion Levels

There are the following levels of coupling and cohesion:

- **Code Level.** This is how the code is arranged. Usually, when investigating the code level, we talk about modules. To understand whether the modules are arranged correctly, the Module Views comes in handy.
- **Runtime Level.** This is how runtime components are arranged. Usually, to look at the runtime level, we use the Component-and-Connector views, which allow us to understand how system components intercommunicate with each other.
- **Business Level.** This level is about business domains. For instance, if the company has the Printing and Delivery departments, they are considered separate business domains. This concept is close to runtime components, but more about groups of people and how they intercommunicate with each other. See Conway's Law [<sup>22</sup>](#references) for more details.

This means that understanding coupling and cohesion is crucial at different levels — starting from the code and finishing with how people communicate with each other.

At every level, the rule is the same — aim to have as few connections as possible. This rule looks obvious when you imagine a big group of people that build a spaceship — the more you chat with everyone about everything, the longer you do your task.

## Cohesion Types

There are some common cohesion types described by Sam Newman. [<sup>8</sup>](#references)

- **Technology Cohesion.** It is about building system elements and their relations prioritizing technical needs rather than the business ones. E.g., the layered architecture is technologically cohesive due to spreading the related business functionality across different layers.
- **Business Functionality Cohesion.** It is about keeping the business domain functionality in one place and avoiding spreading the related functionality by different layers/services.

As you can see, the Technology Cohesion is opposite to the Business Functionality Cohesion. This leads us to the following rule:

> The Business Functionality Cohesion must be prioritized over the Technology Cohesion.

## Coupling Types

According to Sam Newman, there are the following coupling types: [<sup>8</sup>](#references)

- **Implementation Coupling.** This is the regular type of coupling that must be always on radar for software developers. We say that modules are coupled when changes in one module lead to changes in another module.
- **Temporal Coupling.** When runtime components are dependent on each other, there is a Temporal Coupling. E.g., when the Delivery department waits for the Printing department to complete their work, there is a temporal dependency.
- **Deployment Coupling.** Deployment is always a risk, and for this reason, we try to deploy as less and as infrequently as possible. When the deployment of one module/service requires the deployment of another one, there is the Deployment Coupling. When talking about the Release Train (when everything is deployed in one go), we always talk about the Deployment Coupling and consider it as an antipattern.

## Coupling and Cohesion Cases

Let’s explore different cases. Below you can find a diagram that describes connections between “coupling” and “cohesion”. This may be useful for analyzing a system and creating an improvement plan.

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/coupling-and-cohesion.webp" alt="Pic. 3. Coupling and Cohesion.">
<figcaption>Pic. 3. Coupling and Cohesion.</figcaption>
</figure>

### Constantine's Law

There is a classical law defined by Larry Constantine in early 1968:

> A structure is stable if cohesion is high (tight), and coupling is low (loose). — Larry Constantine [<sup>23</sup>](#references)

### Case 1. Ideal — Loose Coupling, Tight Cohesion

This is the desirable state of things inside a system. Such a system is manageable and extensible. In most cases, developers like working with similar systems as they are divided into logical parts; this leads to lower mental pressure during the development process.

Below you can see how connections between elements may look like in such a system.

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/ideal-loose-coupling-tight-cohesion.webp" alt="Pic. 4. Ideal - Loose Coupling, Tight Cohesion.">
<figcaption>Pic. 4. Ideal - Loose Coupling, Tight Cohesion.</figcaption>
</figure>

How to achieve such an elements arrangement? The rule sounds simple: organize related elements in groups (modules) and set up connections between those groups.

#### Example

This is what the code structure may look like in this case:

```bash
system
├── components
│   ├── dropdown
│   .   ├── container.js
│       ├── component.js
│       ├── utils.js
│       ├── use-options-search.js
│       └── index.js
├── utils
│   ├── find-tree-items
│   .   ├── find-tree-items.js
│       ├── find-tree-items.test.js
│       └── index.js
├── hooks
│   ├── use-previous
│   .   ├── use-previous.js
│       ├── use-previous.test.js
│       └── index.js
├── index.js
.
```

And this is a contrived code example:

```jsx
// system/index.js

import usePrevious from 'hooks/use-previous';
import Dropdown from 'components/dropdown';

const Application = () => {
  const [value, setValue] = useState('');
  const previousValue = usePrevious(value);

  const handleChange = useCallback((event) => {
    setValue(event.value);
  }, []);

  return (
    <>
      <span>Pevious value: {previousValue}</span>
      <Dropdown
        onChange={handleChange}
        options={[/*...*/]} />
    </>
  );
};

// ...
```

In the example above, system elements are strictly defined and arranged at appropriate levels. Every system element may have internal connections that define its implementation details. Implementation details of every element are not exposed — clients have access only to the concise <abbr title="Application Programming Interface">API</abbr>.

#### Diagnosis

Usually, you may diagnose the Ideal System by the following simple criteria:

> A system is Ideal when its elements are grouped in modules, and modules have strict boundaries and communicate via concise <abbr title="Application Programming Interfaces">APIs</abbr>.

#### What’s Next?

Nothing to improve — this is the desired state of any system. Depending on business needs, you may want to change something to achieve specific quality attributes: performance, security, scalability, or anything else. Such an ideal state is quite fragile, so you should always plan the transition properly and clearly understand the current and the target architecture.

There is nothing ideal in the world. A concept of the Ideal System is like a golden standard which is never fully achievable.

### Case 2. God Module — Tight Coupling, Tight Cohesion

Subjectively, this is the worst case. Such a system is hardly manageable and cannot be extended in an adequate manner. In this situation, there is a mess of system elements — modules are overloaded and expose unexpected <abbr title="Application Programming Interfaces">APIs</abbr>, intercommunications between modules are complex and unpredictable.

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/god-module-tight-coupling-tight-cohesion.webp" alt="Pic. 5. God Module — Tight Coupling, Tight Cohesion.">
<figcaption>Pic. 5. God Module — Tight Coupling, Tight Cohesion.</figcaption>
</figure>

#### Example

Let’s imagine how this may look in the code structure:

```bash
system
├── components
│   ├── dropdown
│   .   ├── container.js
│       ├── component.js
│       ├── utils.js
│       ├── use-options-search.js
│       ├── use-user-options-data.js
│       ├── use-language-options-data.js
│       └── index.js
├── index.js
.
```

And a contrived code example:

```jsx
// system/components/dropdown/container

import useOptionsSearch from './use-options-search';
import useUserOptionsData from './use-user-options-data';
import useLanguageOptionsData from './use-language-options-data';
import * as utils from './utils';
import Dropdown from './component';

const DropdownContainer = (props) => {
  const optionsSearch = useOptionsSearch(/*...*/);
  const userOptionsData = useUserOptionsData(/*...*/);
  const langageOptionsData = useLanguageOptionsData(/*...*/);

  const optionsData = useMemo(() => {
    switch (props.dataType) {
      case 'user':
        return userOptionsData;
      case 'language':
        return languageOptionsData;
      default:
        return [];
    }
  }, [props.dataType]);

  return (
    <Dropdown {/*...*/} />
  );
};

DropdownContainer.propTypes = {
  onChange: PropTypes.func.isRequired,
  dataType: PropTypes.oneOf(['user', 'language']).isRequired,
};

export default DropdownContainer;
```

The problem here is that there is a logic embedded into a shared (dummy) component. This component should be reusable, and new data types should not affect it. Please, avoid such a design and keep all the specific logic outside the reusable component.

#### Diagnosis

Usually, you may diagnose the God Module by the following simple criteria:

> God Module is when a module exposes a chaotic and verbose <abbr title="Application Programming Interface">API</abbr>.

#### What’s Next?

A system with God Module(s) needs improvement. Decompose God Module(s) into smaller modules consisting of related elements. Keep strict module boundaries.

God Module is often a natural result of non-mature teams or <abbr title="As Soon As Possible">ASAP</abbr>-driven development. Maybe, to improve a system, you need to start from covering managerial gaps first.

### Case 3. Wrong Boundaries — Tight Coupling, Loose Cohesion

Such a situation happens when system modules are defined in a wrong way, and their <abbr title="Application Programming Interfaces">APIs</abbr> belong to different subjects. It may resemble the God Module but split into several sub-modules.

The Wrong Boundaries case may often mean that a system modules don’t follow the <abbr title="Single-Responsibility Principle">SRP</abbr> (Single-Responsibility Principle). [<sup>1</sup>](#references) When the <abbr title="Single-Responsibility Principle">SRP</abbr> is in place, module boundaries are correct, and the module <abbr title="Application Programming Interface">API</abbr> is predictable and concise.

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/wrong-boundaries-tight-coupling-loose-cohesion.webp" alt="Pic. 6. Wrong Boundaries — Tight Coupling, Loose Cohesion.">
<figcaption>Pic. 6. Wrong Boundaries — Tight Coupling, Loose Cohesion.</figcaption>
</figure>

#### Example

This is what the code structure may look like in this case:

```bash
system
├── components
│   ├── dropdown
│   .   ├── container.js
│       ├── component.js
│       └── index.js
├── utils
│   ├── find-tree-items
│   │   ├── find-tree-items.js
│   │   ├── find-tree-items.test.js
│   │   └── index.js
│   ├── dropdown-utils
│   .   ├── ...
│       .
├── hooks
│   ├── use-previous
│   │   ├── use-previous.js
│   │   ├── use-previous.test.js
│   │   └── index.js
│   ├── use-dropdown-options-search
│   .   ├── use-dropdown-options-search.js
│       ├── use-dropdown-options-search.test.js
│       └── index.js
├── index.js
.
```

And this is the contrived code example:

```jsx
// system/components/dropdown/container

import useDropdownOptionsSearch from 'hooks/use-dropdown-options-search';
import * as dropdownUtils from 'utils/dropdown-utils';

import Dropdown from './component';

const DropdownContainer = (props) => {
  const optionsSearch = useDropdownOptionsSearch(/*...*/);

  return (
    <Dropdown {/*...*/} />
  );
};

DropdownContainer.propTypes = {
  onChange: PropTypes.func.isRequired,
  options: PropTypes.arrayOf(PropTypes.object).isRequired,
};

export default DropdownContainer;
```

The problem here is that there are several system elements that don’t have exact module boundaries. Due to this problem, system elements reuse each other chaotically. Such a system must be re-designed, as Wrong Boundaries make it impossible to extend naturally.

#### Diagnosis

Usually, you may diagnose the Wrong Boundaries problem by the following simple criteria:

> There are Wrong Boundaries when system modules are composed of non-related functionality.

#### What’s Next?

Such a system needs improvement. You can start with flattening modules into non-related elements. Then try to re-organize related elements into modules with correct module boundaries.

Such a system may appear in low-budget conditions. In case of the Microservice Architecture, you may have not enough budget for launching a new service, and you decide to extend existing services with new <abbr title="Application Programming Interfaces">APIs</abbr>. Time goes, relations between services become more complex…

Maybe, you need to start from solving business-level problems before changing the code. In some conditions, code changes make no sense without changing of the business vision.

### Case 4. Destructive Decoupling — Loose Coupling, Loose Cohesion

Such a system may resemble a handful of small balls thrown on the floor — sparse and chaotic. And it is rather hard to understand module boundaries and its applications.

This situation may look quite close to the God Module one — lots of elements with non-deterministic connections. However, there is an important distinction between these two situations. Usually, talking about the God Module, we imagine a system element with somehow defined boundaries and a mixed <abbr title="Application Programming Interface">API</abbr>. In case of the Destructive Decoupling, there are no module boundaries at all — a system consists of elements that are not grouped by a domain (criteria).

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/destructive-decoupling-loose-coupling-loose-cohesion.webp" alt="Pic. 7. Destructive Decoupling — Loose Coupling, Loose Cohesion.">
<figcaption>Pic. 7. Destructive Decoupling — Loose Coupling, Loose Cohesion.</figcaption>
</figure>

#### Example

This is what the code structure may look like in this case:

```bash
system
├── dropdown.js
├── find-tree-items.js
├── find-tree-items.test.js
├── dropdown-utils.js
├── use-previous.js
├── use-previous.test.js
├── use-dropdown-options-search.js
├── use-dropdown-options-search.test.js
├── index.js
.
```

And this is the contrived code example:

```jsx
// app/index.js

import usePrevious from './use-previous';
import Dropdown from './dropdown';

const App = () => {
  const [value, setValue] = useState('');
  const previousValue = usePrevious(provalue);

  const handleChange = useCallback((event) => {
    setValue(event.value);
  }, []);

  return (
    <>
      <span>Pevious value: {previousValue}</span>
      <Dropdown
        onChange={handleChange}
        options={[/*...*/]} />
    </>
  );
};

// ...
```

The example above shows what the Destructive Decoupling may look like in the code — you can see a pile of elements with no groups. I.e., when you develop a new element and want to reuse an existing functionality, you have to take its pieces from the pile of unrelated elements. You may imagine yourself as a sloppy craftsman who tries to find the right tool in a huge box of mixed stuff — not an effective way of organizing the workplace.

#### Diagnosis

Usually, you may diagnose the Destructive Decoupling by the following simple criteria:

> Destructive Decoupling is when there are lots of ungrouped elements with chaotic relations.

#### What’s Next?

In some cases, such a system needs improvement. If you strongly decided to rework such a system, you should organize related elements into modules and keep strict module boundaries.

Destructive Decoupling may naturally appear in small systems and sub-systems. A possible reason is that there may not be a big sense in organizing elements into modules if the number of elements is small.

In other rare cases, the Destructive Decoupling may be the target architecture. The main idea here is to have lots of small elements connected together with a mediator. Sometimes it works.

All this means, that you may not want to change such a system with Destructive Decoupling, and that’s absolutely fine!

### Recap on Coupling and Cohesion Cases

The following table summarizes different cases of coupling and cohesion.

| Case | Diagnosis | What’s next? |
| --- | --- | --- |
| 1. Ideal — Loose Coupling, Tight Cohesion | Elements are grouped in modules. Modules have strict boundaries and communicate via concise <abbr title="Application Programming Interfaces">APIs</abbr>. | Nothing to improve — this is the desired state of any system. |
| 2. God Module — Tight Coupling, Tight Cohesion | A module exposes a chaotic and verbose <abbr title="Application Programming Interface">API</abbr>. | Decompose the God Module into smaller modules consisting of related elements. Keep strict module boundaries. |
| 3. Wrong Boundaries — Tight Coupling, Loose Cohesion | Modules are composed of non-related functionality. | Flatten modules into non-related elements. Then re-organize related elements into modules. Keep strict module boundaries. |
| 4. Destructive Decoupling — Loose Coupling, Loose Cohesion | There are lots of ungrouped elements with chaotic relations. | Organize related elements into modules. Keep strict module boundaries. |

<figure>
<img src="/assets/blog/organizing-modules-in-big-projects-loose-coupling-and-tight-cohesion/everything-you-must-know-about-coupling-and-cohesion-cases.webp" alt="Pic. 8. This is everything you must  know about coupling and cohesion cases.">
<figcaption>Pic. 8. This is everything you must know about coupling and cohesion cases.</figcaption>
</figure>

## Side Notes

### Microservice Architecture vs Modules

From the first glance, you may think that this article tries to convince you using the Microservice Architecture or similar to that. Like, split your system in modules/services, host them independently and live a happy life. Microservice Architecture is a modern solution that has its pros and cons. However, splitting a system into modules doesn’t always means that you must implement the Microservice Architecture.

If your intention to improve a monolith system, I would recommend you following the Sam Newman's step-by-step tutorial for making monolith a better system. [<sup>8</sup>](#references) As an example, you may consider splitting a monolith into a modular monolith, which aligns with all concepts described in this article.

## What’s Next?

My strong recommendation is to proceed with deep investigation of foundational terms that you can find at the start of the article. If you want to improve a system you are responsible for, you need to rely only on trustworthy resources like books and official guides.

If you don’t know what kind your system of, you may want to start from the introspection. This means you need to understand how the given system operates and document it properly according to the <abbr title="Software Engineering Institute">SEI</abbr> recommendations. [<sup>2</sup>](#references) It will be impossible to guess about a system without appropriate views.

Try to concentrate not at code but at the product. Code makes the product but not backward. That is, try to design the architecture that fits requirements and avoid changes and synthetic improvements just for fun.

Architecture as a whole is more important than coupling and cohesion themselves.

## References

1. <a href="https://en.wikipedia.org/wiki/Single-responsibility_principle" rel="noopener noreferrer" target="_blank">Single-Responsibility Principle - Wikipedia</a>
2. <a href="https://www.amazon.com/Software-Architecture-Practice-SEI-Engineering/dp/0136886094" rel="noopener noreferrer" target="_blank">Software Architecture in Practice (SEI Series in Software Engineering) - Book on Amazon</a>
3. <a href="https://en.wikipedia.org/wiki/Software_system" rel="noopener noreferrer" target="_blank">Software System - Wikipedia</a>
4. <a href="https://en.wikipedia.org/wiki/Service-oriented_architecture" rel="noopener noreferrer" target="_blank">Service-Oriented Architecture - Wikipedia</a>
5. <a href="https://microservices.io/index.html" rel="noopener noreferrer" target="_blank">Microservice Architecture</a>
6. <a href="https://micro-frontends.org" rel="noopener noreferrer" target="_blank">Micro Frontends</a>
7. <a href="https://atomicdesign.bradfrost.com" rel="noopener noreferrer" target="_blank">Atomic Design - Open Source Book</a>
8. <a href="https://www.amazon.com/Monolith-Microservices-Evolutionary-Patterns-Transform/dp/1492047848" rel="noopener noreferrer" target="_blank">Monolith to Microservices: Evolutionary Patterns to Transform Your Monolith - Book on Amazon</a>
9. <a href="https://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215" rel="noopener noreferrer" target="_blank">Domain-Driven Design: Tackling Complexity in the Heart of Software - Book on Amazon</a>
10.  <a href="https://www.researchgate.net/publication/221331713_Information_Distribution_Aspects_of_Design_Methodology" rel="noopener noreferrer" target="_blank">Information Distribution Aspects of Design Methodology - Classical Article by David Parnas</a>
11.  <a href="https://dl.acm.org/doi/10.1145/361598.361623" rel="noopener noreferrer" target="_blank">On the Criteria to be Used in Decomposing Systems into Modules - Classical Paper by David Parnas</a>
12.  <a href="https://dl.acm.org/doi/abs/10.5555/944331.944357" rel="noopener noreferrer" target="_blank">The Secret History on Information Hiding - Classical Paper by David Parnas</a>
13.  <a href="https://youtu.be/5OjqD-ow8GE?si=zYUHC2kqpgd0jfi8" rel="noopener noreferrer" target="_blank">Talk by Simon Brown about Modular Monoliths</a>
14.  <a href="https://shopify.engineering/deconstructing-monolith-designing-software-maximizes-developer-productivity" rel="noopener noreferrer" target="_blank">Deconstructing the Monolith: Designing Software that Maximizes Developer Productivity - Article by Kirsten Westeinde from Shopify</a>
15.  <a href="https://youtu.be/gyZDWsLk_Ac" rel="noopener noreferrer" target="_blank">Deconstructing the Monolith - Kirsten Westeinde, Shopify | Craft Conference 2022 - YouTube Video</a>
16.  <a href="https://martinfowler.com/bliki/DesignStaminaHypothesis.html" rel="noopener noreferrer" target="_blank">Design Stamina Hypothesis - Article by Martin Fowler</a>
17.  <a href="https://martinfowler.com/articles/microservices.html" rel="noopener noreferrer" target="_blank">Microservices - Article by Martin Fowler and Co</a>
18.  <a href="https://martinfowler.com/bliki/MonolithFirst.html" rel="noopener noreferrer" target="_blank">Monolith First - Article by Martin Fowler</a>
19.  <a href="https://martinfowler.com/bliki/MicroservicePremium.html" rel="noopener noreferrer" target="_blank">Microservice Premium - Article by Martin Fowler</a>
20.  <a href="https://martinfowler.com/bliki/BoundedContext.html" rel="noopener noreferrer" target="_blank">Bounded Context - Article by Martin Fowler</a>
21.  <a href="https://martinfowler.com/bliki/SacrificialArchitecture.html" rel="noopener noreferrer" target="_blank">Sacrificial Architecture - Article by Martin Fowler</a>
22.  <a href="https://martinfowler.com/bliki/ConwaysLaw.html" rel="noopener noreferrer" target="_blank">Conway’s Law - Article by Martin Fowler</a>
23.  <a href="http://principles-wiki.net/principles:constantine_s_law" rel="noopener noreferrer" target="_blank">Constantine's Law - Article on Principles Wiki</a>
