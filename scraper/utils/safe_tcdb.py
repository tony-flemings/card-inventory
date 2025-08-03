from loguru import logger

def safe_search_cards(search_term):
    try:
        import SportsCardTool.tcdb as tcdb
        if hasattr(tcdb, "search_cards"):
            logger.info(f"Searching TCDB for: {search_term}")
            return tcdb.search_cards(search_term)
        else:
            logger.warning("TCDB module found but 'search_cards' is missing.")
    except ImportError:
        logger.warning("TCDB module not available.")
    except Exception as e:
        logger.error(f"Unexpected error during TCDB search: {e}")
    return []
