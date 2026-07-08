# ==========================================================
# Attention Papers
#
# Generic Repository Scaffolder
#
# Examples:
#
# make year YEAR=2015 \
#   CATEGORIES="attention memory-networks"
#
# make year YEAR=2016 \
#   CATEGORIES="memory-networks key-value-memory"
#
# make theme THEME=kv-cache-compression
#
# make paper \
#   YEAR=2016 \
#   CATEGORY=memory-networks \
#   PAPER=key-value-memory-networks
#
# ==========================================================

ROOT := papers
THEMES := themes

.PHONY: year theme paper clean tree

# ----------------------------------------------------------
# Create a new year
# ----------------------------------------------------------

year:
ifndef YEAR
	$(error YEAR is required)
endif

	@echo "📚 Creating $(YEAR)..."

	@mkdir -p $(ROOT)/$(YEAR)

	@touch $(ROOT)/$(YEAR)/README.md

ifdef CATEGORIES
	@for category in $(CATEGORIES); do \
		mkdir -p $(ROOT)/$(YEAR)/$$category; \
		touch $(ROOT)/$(YEAR)/$$category/README.md; \
	done
endif

	@echo "✅ $(YEAR) created."

# ----------------------------------------------------------
# Create a research theme
# ----------------------------------------------------------

theme:
ifndef THEME
	$(error THEME is required)
endif

	@mkdir -p $(THEMES)/$(THEME)

	@touch $(THEMES)/$(THEME)/README.md
	@touch $(THEMES)/$(THEME)/timeline.md
	@touch $(THEMES)/$(THEME)/taxonomy.md
	@touch $(THEMES)/$(THEME)/mathematics.md
	@touch $(THEMES)/$(THEME)/comparisons.md
	@touch $(THEMES)/$(THEME)/open-problems.md
	@touch $(THEMES)/$(THEME)/references.bib

	@mkdir -p $(THEMES)/$(THEME)/figures

	@echo "✅ Theme created."

# ----------------------------------------------------------
# Create a paper
# ----------------------------------------------------------

paper:
ifndef YEAR
	$(error YEAR is required)
endif

ifndef CATEGORY
	$(error CATEGORY is required)
endif

ifndef PAPER
	$(error PAPER is required)
endif

	@mkdir -p $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)

	@touch $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)/README.md
	@touch $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)/summary.md
	@touch $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)/notes.md
	@touch $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)/math.md
	@touch $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)/references.bib

	@mkdir -p $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)/figures
	@mkdir -p $(ROOT)/$(YEAR)/$(CATEGORY)/$(PAPER)/assets

	@echo "📄 Paper scaffold created."

# ----------------------------------------------------------

tree:
	@tree papers themes

clean:
	@rm -rf papers themes
	@echo "🗑️ Repository cleaned."